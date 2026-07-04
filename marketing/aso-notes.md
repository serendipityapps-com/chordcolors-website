# ASO pass — App Store listing changes (do with next app update)

## Ratings (the #1 conversion problem: 3 ratings as of July 2026)
- The in-app rating prompt (already implemented in the app repo, `src/features/AppRating/`) is
  the fix — confirm it's enabled in the shipping build and fires after a genuine "aha" moment.
- Reply to every review in App Store Connect (replies are public and signal an alive app).
- Goal: 25+ ratings within a month of the rating-gate shipping. Check weekly in ASC → Ratings.

## Title & subtitle (30 chars each — keyword-bearing, highest ASO weight)
- Title now: "Chord Colors: Piano and Guitar" — keep (has "chord", "piano", "guitar").
- Subtitle: use all 30 chars with keywords NOT already in the title.
  Current: "Chords, Scales & Progressions" — wastes "Chords" (already in title as "Chord").
  Suggested: **"Music Theory, Scales & Songs"** (adds "music theory" — your highest-intent term)
  or "Learn Music Theory in Color" (adds "learn" + the differentiator).

## Keyword field (100 chars, comma-separated, NO spaces, don't repeat title/subtitle words)
Suggested string (98 chars):
`progression,circle of fifths,ear training,songwriting,harmony,key,voicing,chords app,fifths,jam`
(Adjust against what's already in title/subtitle — words in those fields are indexed
automatically and repeating them in the keyword field wastes characters.)

## Screenshots (first 3 do all the work — they show in search results)
1. Colors mid-progression + caption "See why chords work"
2. Circle of fifths color mapping + "Every key is a color"
3. Progressions browser + "470 progressions to steal"
4. Guitar voicings + "1,882 guitar voicings"
5. Scales + "148 scales from around the world"
Captions: big text top of each screenshot, benefit language not feature language.

## App Preview video
See `fiverr-app-preview-brief.md` — goes in slot 0, autoplays muted in search. For a visual app
this is worth more than everything else on this page combined.

## Category
Primary: Music (correct). Consider secondary: Education — it adds a browse surface and the
"learn music theory" audience lives there.

## Measure
App Store Connect → Analytics: watch **conversion rate** (product page views → installs) weekly.
Listing changes are working if CVR climbs even while ad traffic (lower intent) grows.
