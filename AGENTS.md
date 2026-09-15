# AGENTS.md

Guidance for AI coding agents working in this repository. `CLAUDE.md` is a symlink to this file.

## What this repo is

The source text and published site for the **Remake Learning Playbook**, a 2015 book by The Sprout Fund documenting how the Pittsburgh region built a learning innovation network. The book is finished; this repo preserves it. Work here is archival maintenance, not authoring.

## Layout

- `README.md` — about the Playbook, with links to every section.
- `SUMMARY.md` — GitBook-style table of contents. Keep it in sync with `README.md` when links change.
- `chapters/` — the six chapters plus a guest note and a guest essay.
- `case-studies/` — eleven case studies of network projects.
- `plays/` — the five plays (Convene, Catalyze, Communicate, Coordinate, Champion).
- `chapters.md`, `case-studies.md`, `plays-in-detail.md` — section landing pages.
- `docs/` — the published static site. HTML, CSS, JS, fonts, images, and downloadable PDFs. Edited by hand; there is no build step. The folder is named `docs/` because GitHub Pages branch deployment only accepts `/` or `/docs` as the publishing folder; it is not documentation.

## Hosting

- **GitHub Pages**, deployed from the `master` branch, `/docs` folder. Live at https://playbook.remakelearning.org/.
- **Custom domain** set in `docs/CNAME`. The DNS record is a CNAME from `playbook.remakelearning.org` to `sproutfund.github.io`, held in the `remakelearning.org` zone at pair Networks. The Sprout Fund does not control that zone; Remake Learning does. If the record is ever removed or repointed, the site goes dark and `docs/CNAME` must be changed or deleted. The apex zone listing does not show subdomain records, so check the name directly (`dig playbook.remakelearning.org CNAME`).
- **HTTPS** is provisioned by GitHub through Let's Encrypt and renewed automatically every 90 days once the CNAME resolves. No one has to act on renewal. There is no Cloudflare or other proxy in front of the site.

## Working rules

- **Preserve the published text.** The Markdown is the book as printed. Do not rewrite, modernize, or "improve" prose. Fix a broken link or a typo only when asked.
- **Link maintenance is the main job.** Most recent commits update or remove URLs that have rotted (organization sites, project pages, purchase links). When updating a link, prefer an archival URL over deleting the reference.
- **Markdown and `docs/` are separate copies.** A change to a link or a name usually needs to land in both the Markdown source and the corresponding HTML under `docs/`. Check both.
- **Keep commits small and specific.** One concern per commit, with a subject line that says what changed (the existing history is the model: "Update Digital Corps links", "Remove Kindle purchase links").
- **Stage by path.** Use `git add <files>` and `git commit -- <files>`; never `git add -A`. Leave `.DS_Store` out.
- **Do not push without being asked.** Pushing publishes to the live site.

## Related context

This repo is symlinked into Matt Hannigan's personal notes repo (Positronic Matt-rix) at `workstreams/dev/sproutfund_remake-learning-playbook`. Sessions started from that repo carry its skills and hooks; those apply to work here, but that repo's automation (sync, nightly logs, scheduled pushes) does not touch this one.
