#!/usr/bin/env bash
#
# One-time (idempotent) setup of the Cloudflare Cache Rule that edge-caches
# app.chordcolors.com and the marketing site aggressively, so the Pages origin
# is rarely hit.
#
# WHY: today HTML is served DYNAMIC (never edge cached), so every HTML request
# goes to the Pages origin and a small fraction time out as 504 Gateway
# Timeout. Caching HTML at the edge removes almost all of those origin hits.
#
# "Cache forever" is safe here because freshness is handled two ways:
#   - Browsers still revalidate. Browser TTL = respect origin, and Pages already
#     sends `cache-control: public, max-age=0, must-revalidate` on HTML.
#   - Every deploy purges the edge (the "Purge Cloudflare edge cache" step in
#     the deploy workflows of this repo and of chordcolors-app).
# Errors are never cached: 4xx = no-cache, 5xx = no-store (so a 504 can't stick).
#
# RUN ONCE (re-running just re-applies the same rule):
#   CLOUDFLARE_CACHE_TOKEN=xxxxx bash scripts/setup-cloudflare-cache.sh
#
# TOKEN (Cloudflare dashboard -> My Profile -> API Tokens -> Create Custom
# Token), scoped to zone chordcolors.com:
#   - Zone    > Cache Rules > Edit
#   - Zone    > Cache Purge > Purge          (also used by the deploy purge step)
#   - Account > Account Rulesets > Edit       (add only if this call 403s)
# Use the SAME token as the CLOUDFLARE_CACHE_TOKEN repo secret in both
# chordcolors-website and chordcolors-app.
#
# NOTE: this PUTs the whole http_request_cache_settings phase, i.e. it makes
# this the ONLY cache rule on the zone. If you add other cache rules later,
# add them to the payload below too.
set -euo pipefail

ZONE_ID="fd5d5aa36a799afac2e20ffa025d33f2"   # chordcolors.com
: "${CLOUDFLARE_CACHE_TOKEN:?Set CLOUDFLARE_CACHE_TOKEN (see header for the permissions it needs)}"

payload="$(mktemp)"
trap 'rm -f "$payload"' EXIT
cat > "$payload" <<'JSON'
{
  "rules": [
    {
      "description": "chordcolors: edge-cache everything (app + marketing site)",
      "expression": "(http.host eq \"app.chordcolors.com\") or (http.host eq \"chordcolors.com\") or (http.host eq \"www.chordcolors.com\")",
      "action": "set_cache_settings",
      "action_parameters": {
        "cache": true,
        "browser_ttl": { "mode": "respect_origin" },
        "edge_ttl": {
          "mode": "override_origin",
          "default": 31536000,
          "status_code_ttl": [
            { "status_code_range": { "from": 400, "to": 499 }, "value": 0 },
            { "status_code_range": { "from": 500, "to": 599 }, "value": -1 }
          ]
        }
      }
    }
  ]
}
JSON

resp="$(curl -fsS -X PUT \
  "https://api.cloudflare.com/client/v4/zones/${ZONE_ID}/rulesets/phases/http_request_cache_settings/entrypoint" \
  -H "Authorization: Bearer ${CLOUDFLARE_CACHE_TOKEN}" \
  -H "Content-Type: application/json" \
  --data @"$payload")"

echo "$resp"
echo "$resp" | grep -qE '"success":[[:space:]]*true' || { echo "FAILED to install cache rule"; exit 1; }
echo
echo "Cache rule installed on zone chordcolors.com."
echo "Warm it up, then verify a HIT:"
echo "  curl -sI https://app.chordcolors.com/ | grep -i cf-cache-status   # first request MISS, next HIT"
