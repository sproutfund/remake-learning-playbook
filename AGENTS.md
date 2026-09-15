# AGENTS.md

Guidance for AI coding agents working in this repository. `CLAUDE.md` is a symlink to this file.

## What this repo is

The source text and published site for the **Remake Learning Playbook**, a 2015 book by The Sprout Fund documenting how the Pittsburgh region built a learning innovation network. The book is finished; this repo preserves it. Work here is archival maintenance, not authoring.

## Layout

- `README.md` — about the Playbook, with links to every section.
- `SUMMARY.md` — GitBook-style table of contents. Keep it in sync with `README.md` when links change.
- `chapters/` — the welcome letter, six chapters, a guest note, and a guest essay.
- `case-studies/` — eleven case studies of network projects.
- `plays/` — the five plays (Convene, Catalyze, Communicate, Coordinate, Champion), one file per action area.
- `chapters.md`, `case-studies.md`, `plays-in-detail.md` — section landing pages.
- `additional-resources.md`, `acknowledgements.md` — back matter.
- `sources/` — the XML and XSLT that built the site in 2015, plus the ebook's XHTML source. **This is the source of truth for the text.** See `sources/README.md`.
- `scripts/xml-to-markdown.py` — regenerates every Markdown file above from `sources/*.xml`. Stdlib only; run `python3 scripts/xml-to-markdown.py` from anywhere.
- `docs/` — the published static site. HTML, CSS, JS, fonts, images, and downloadable PDFs. Edited by hand; there is no build step. The folder is named `docs/` because GitHub Pages branch deployment only accepts `/` or `/docs` as the publishing folder; it is not documentation.

## Two copies of the text

The Markdown and the `docs/` HTML are separate renderings of the same book:

- **Markdown** is generated. Never edit `chapters/`, `case-studies/`, `plays/`, the landing pages, `additional-resources.md`, or `acknowledgements.md` by hand. Edit the XML in `sources/` and re-run the script; commit the XML, the script if it changed, and the regenerated files together.
- **HTML** under `docs/` is hand-maintained. The XSLT in `sources/` can no longer reproduce it (the site's navigation and order forms were stripped in 2026), so a correction has to be made in the HTML directly as well as in the XML.

## Hosting

- **GitHub Pages**, deployed from the `master` branch, `/docs` folder. Live at https://playbook.remakelearning.org/.
- **Custom domain** set in `docs/CNAME`. The DNS record is a CNAME from `playbook.remakelearning.org` to `sproutfund.github.io`, held in the `remakelearning.org` zone at pair Networks. The Sprout Fund does not control that zone; Remake Learning does. If the record is ever removed or repointed, the site goes dark and `docs/CNAME` must be changed or deleted. The apex zone listing does not show subdomain records, so check the name directly (`dig playbook.remakelearning.org CNAME`).
- **HTTPS** is provisioned by GitHub through Let's Encrypt and renewed automatically every 90 days once the CNAME resolves. No one has to act on renewal. There is no Cloudflare or other proxy in front of the site.

## Working rules

- **Preserve the published text.** The book is finished. Do not rewrite, modernize, or "improve" prose. Fix a broken link or a typo only when asked.
- **Link maintenance is the main job.** Most commits update or remove URLs that have rotted. Prefer an archival URL over deleting the reference. Make the change in both the XML and the HTML.
- **Keep commits small and specific.** One concern per commit, with a subject line that says what changed (the history is the model: "Update Digital Corps links", "Remove Kindle purchase links").
- **Stage by path.** Use `git add <files>` and `git commit -- <files>`; never `git add -A`. Leave `.DS_Store` out.
- **Do not push without being asked.** Pushing publishes to the live site.

## Related context

This repo is symlinked into Matt Hannigan's personal notes repo (Positronic Matt-rix) at `workstreams/dev/sproutfund_remake-learning-playbook`. Sessions started from that repo carry its skills and hooks; those apply to work here, but that repo's automation (sync, nightly logs, scheduled pushes) does not touch this one.
