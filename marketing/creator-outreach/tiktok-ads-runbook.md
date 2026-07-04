# TikTok Ads runbook — self-serve, no AI needed

## Phase A — Register for the credit BEFORE creating the ads account
Timing: do this the day your first creator says yes (the spend-match requires qualifying spend
within **30 days of registration**, so don't start the clock early).

1. Go to TikTok's official new-advertiser incentive page:
   https://ads.tiktok.com/help/article/about-the-incentive-program-for-new-advertisers
   Follow its signup link to register — the credit only applies if you register through the
   promo page **before** the Ads Manager account exists.
2. Then create the Ads Manager account (business.tiktok.com) with the same email.
3. Target tier: **spend $500 in 30 days → get $500 credit**. Boosts from inside the TikTok app
   do NOT count — only Ads Manager campaigns.
4. While in there, look for **TikTok One → Creative Challenge** (creators make ad videos from
   your brief on spec; you pay based on selection/performance). If your account has access,
   post `creator-brief.md` there too. If not visible, skip — the direct creator deals cover it.

## Phase B — Spark Ads (boosting creator posts)

**Getting the code from the creator** (also in reply-templates #1/#5):
their video → "..." → Ad settings → Ads authorization ON → Generate code (60 days) → they send it.

**Attaching it:** Ads Manager → Tools/Assets → Creative → **Spark Ads posts** → "Apply for
authorization" → paste code → the post appears as usable creative.

**Campaign setup (keep it this simple):**
- Objective: **Traffic**, destination = the App Store URL
  https://apps.apple.com/us/app/chord-colors-piano-and-guitar/id1422598441
  (App-promotion objective needs an attribution partner (MMP) to be useful — skip at this scale.
  Measure installs in App Store Connect instead.)
- One campaign, one ad group per Spark post.
- Targeting: US (+UK/CA/AU if budget allows), age 18–44, interests: Music / Musical instruments /
  Education. Don't over-narrow; the creative self-selects the audience.
- Budget: **$20–25/day per ad group** (minimum is $20).
- Placement: TikTok only, turn OFF Pangle/global placements.

**Kill/scale rules (check daily, 5 min):**
- Kill an ad group at ~$50 spent if CTR < 1% or basically no App Store movement.
- A winner (CTR ≥ 2% and App Units clearly up): raise budget ~50% every 2 days. Don't double overnight.
- Measure installs: App Store Connect → Analytics → Metrics → App Units (watch the daily trend
  vs. your pre-ads baseline; expect noise, judge over 3+ days).
- Sanity benchmark: music-category iOS installs average ≈ $2. If you're way over after $150
  total spend, pause everything — the problem is the creative, not the targeting. Boost a
  different creator's video instead.

## Phase C — Other credits (only after TikTok spend-match is earned)
- Apple Ads: ads.apple.com — $100 new-advertiser credit is automatic. Spend it on exact-match
  keywords: "chord progressions", "circle of fifths", "music theory app", "chord finder".
  Set a $5/day cap; Apple Ads at this scale is set-and-forget.
- Google Ads ($550 credit at $1k spend) and Reddit ($500–1000 match): only if TikTok proves out.
  Don't open these accounts until you're ready to spend — same clock rules.

## Fallback if direct creator outreach underperforms
Billo (billo.app): sign up (newsletter = $20 off first order), create a job, paste
`creator-brief.md`, order 5 videos "authentic UGC" style, and in the job questions require
"must play piano or guitar — include a clip playing in your application". Pick applicants whose
sample shows real playing. ~$500 for 5 videos; use them as Spark-style ads from your own
account or as non-Spark ad creative.
