# Open issues

Known problems in the Playbook that have no fix committed yet. Each entry says what
is wrong, what was already checked, and what a fix would take. Newest at the bottom.

## Five "Voices of the Network" interviews no longer play

`additional-resources.md` links seventeen audio interviews, each as a SoundCloud
widget URL carrying a numeric track ID. Twelve still play. **Five return 404**, and
the underlying tracks are gone from the `sproutfund` SoundCloud account:

| Interviewee | Section | Dead track ID | Line in `additional-resources.md` |
|---|---|---|---|
| Corey Wittig | Voices from Libraries, Museums & Cultural Institutions | 217633148 | 137 |
| Jane Werner | Voices from Libraries, Museums & Cultural Institutions | 217633142 | 143 |
| Drew Davidson | Voices from Higher Education | 217633146 | 157 |
| Illah Nourbakhsh | Voices from Higher Education | 217633143 | 163 |
| Gregg Behr | Voices from Civic Leadership | 217633145 | 197 |

The same URLs appear in `sources/playbook.xml` (lines 744, 749, 766, 771, 810) and
`docs/index.html` (lines 1401, 1406, 1423, 1428, 1467). They were left as they are; a
dead link is easier to find later than a link silently pointed somewhere else.

### What was checked

The surviving tracks are titled `<Name> [complete interview]` on the `sproutfund`
account, under permalinks of the form `soundcloud.com/sproutfund/brahms-lisa-complete`.
The five missing ones have no permalink — `wittig-corey-complete`,
`werner-jane-complete`, `davidson-drew-complete`, `nourbaksh-illah-complete` and
`behr-gregg-complete` all return "This track was not found". Short pull-quote clips
for the same five people *do* survive (`…-quote`), but those are different, much
shorter recordings and are not what the book links.

The Wayback Machine has 2022 captures of the five widget URLs, but a capture of a
SoundCloud *player* is a picture of a player, not playable audio. It is not a fix.

### The source audio exists

All five interviews are on the Sprout network volume at
`/Volumes/Sprout/docs_program/Programs  Learning/Remake Learning Playbook/Voices/Interviews/`.
Durations match the published tracks, so this is the same material:

| Interviewee | File | Size | Duration |
|---|---|---|---|
| Jane Werner | `Jane Werner.mp3` | 11.3 MB | 15:42 |
| Gregg Behr | `Gregg Behr.mp3` | 9.7 MB | 13:25 |
| Illah Nourbakhsh | `Illah Nourbaksh.mp3` | 8.5 MB | 11:51 |
| Drew Davidson | `Drew Davidson.mp3` | 8.7 MB | 12:07 |
| Corey Wittig | `Corey Wittig.WAV` | 63 MB | 11:57 |

Four are already mp3 at 96 kbps. Corey Wittig exists only as WAV and would need
encoding. The same folder also holds `Transcripts/` — a `.docx` per interview,
including all five — plus `Pull Quotes/` and `Photos/`.

### Why re-uploading to SoundCloud was ruled out

SoundCloud's free tier now caps total uploaded content at 180 minutes. The
`sproutfund` account already carries 31 tracks, so there is no room to restore the
five without paying or deleting something. **YouTube is the better host**, matching
the route already taken for the case-study videos, which were moved from dead Vimeo
embeds to 2025 YouTube re-uploads (commit `062f0c2`).

### What a fix takes

1. Encode `Corey Wittig.WAV` to mp3.
2. Upload all five to the Sprout Fund YouTube channel, titled to match the SoundCloud
   convention (`<Name> [complete interview]`).
3. Rewrite the five links in `sources/playbook.xml` and `docs/index.html`, then
   regenerate the Markdown.
4. Decide whether the twelve surviving SoundCloud links move to YouTube too. Leaving
   them split across two hosts is the cheaper option but makes the section
   inconsistent, and the remaining twelve sit on the same free account with the same
   180-minute ceiling — they are one account change away from the same problem.

## Eight references could not be recovered

The September 2026 link-rot pass unlinked eight references whose targets are gone
with no usable archive. The descriptive text is preserved in each case; only the
link was removed. If any of these turn up, they can be relinked:

- **Handmade in MAKESHOP** catalog PDF (`case-studies/makeshop.md`) — was on Carnegie
  Museums' S3 bucket; no Wayback capture at any date. Not held locally.
- **Hummingbird Duo User Guide** PDF (`case-studies/birdbrain-technologies.md`) — was a
  Dropbox public link; the only capture is a 2024 one of Dropbox's 404 page. The other
  three BirdBrain Dropbox PDFs were recoverable and now point at 2016 captures.
- **Introduction to Circuit Blocks** (`case-studies/childrens-innovation-project.md`) —
  `ciplearningstore.com`; its one capture is excluded from the Wayback Machine.
- **Energy Lab** (`case-studies/elizabeth-forward-school-district.md`) — Elizabeth
  Forward's Edline page; the only capture is a 2022 one of a 404.
- **Four Mozilla Thimble teaching kits** (`case-studies/digital-corps.md`) — the Creative
  Computing, Webmaking, Mobile Media and Digital Literacy facilitation kits. Mozilla
  retired Thimble; every capture is from 2022 and caught the redirect to Mozilla's
  "Thimble is retired" notice rather than the kit contents.
