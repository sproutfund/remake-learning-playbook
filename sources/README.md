# Sources

The working files behind the published Playbook site and ebook, recovered in
September 2026 from The Sprout Fund's network share
(`webwork/remakelearning_playbook/`). The copies in this directory are now the
maintained versions; the share is an untouched snapshot from December 2017.

## XML and XSLT

| File | Date on share | What it is |
|------|---------------|------------|
| `playbook.xml` | 2015-12-04 (version attribute `2015-10-21`) | Welcome letter, chapters 1–6, the guest note and essay, Additional Resources (advocacy kit, Gameplan walkthrough, Voices of the Network), and Acknowledgements. Chapter bodies are HTML fragments; each `<chapter>` carries its Medium URL. |
| `case-studies.xml` | 2015-10-26 | Eleven case studies as structured fields: name, title, teaser, body text, by-the-numbers, network-in-action, persons of interest, more-info, downloads, online resources, related projects, tags, photos, Medium and Vimeo links. A twelfth empty `<case>` is a template. |
| `plays-in-detail.xml` | 2015-10-22 | Five play groups (Convene, Catalyze, Communicate, Coordinate, Champion), each with a teaser, thinking questions, and its plays: excerpt, getting-started advice, and examples. Text-identical to the Gameplan web app's per-area XML. |
| `playbook_html.xslt` | 2015-11-02 | The stylesheet that rendered the three XML files into `docs/index.html`, `docs/case-studies.html`, and `docs/plays-in-detail.html`. |

The XSLT uses five named HTML entities (`&ldquo;`, `&rdquo;`, `&lsquo;`,
`&rsquo;`, `&amp;`) that a strict XML parser rejects. Replace the four
typographic ones with numeric references before running xsltproc; the render
then matches the November 2015 HTML on the share to within one line.

The HTML in `docs/` carries corrections that were never made in the XML: a
June 2016 rewrite of the Elizabeth Forward statistics for the second printing,
and link updates made in the repo since. Those are being ported into this copy
of the XML so the Markdown export stays reproducible; see the commit history.

## epub/

Source files for the ebook builds in `docs/downloads/` (the `.epub` and
`.mobi` dated 2015-10-26): one XHTML file per chapter, case study, and play
group, plus the OPF manifest, NCX table of contents, and the store description.
The stylesheet they reference (`../Styles/playbook.css`) was not on the share.
The built ebooks themselves are not duplicated here.

## Not brought over

Left on the share: a `local/` copy of the HTML with local CSS paths, vendored
Bootstrap/jQuery/Font Awesome libraries, the dead print-edition order form
(`google-form.html`), a standalone acknowledgements page whose content is
already in `playbook.xml`, and the Gameplan app's 215 MB of full-resolution
photos (the sized versions the pages use are in `docs/images/`).
