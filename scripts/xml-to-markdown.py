#!/usr/bin/env python3
"""Export the Remake Learning Playbook from its XML sources to Markdown.

Reads sources/playbook.xml, sources/case-studies.xml, and
sources/plays-in-detail.xml and writes the Markdown book into chapters/,
case-studies/, plays/, plus the three section landing pages and the
additional-resources and acknowledgements pages at the repo root.

Stdlib only. Run from anywhere:

    python3 scripts/xml-to-markdown.py

The XML is the source of truth. Edit it and re-run; never hand-edit the
generated Markdown.
"""

import html
import re
import sys
import xml.etree.ElementTree as ET
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
SRC = ROOT / "sources"
IMAGES = ROOT / "docs" / "images"
DOWNLOADS = ROOT / "docs" / "downloads"

CHAPTER_FILES = {
    "welcome-letter": "chapters/welcome-letter.md",
    "chapter-1-introduction": "chapters/chapter-1-introduction.md",
    "chapter-2-remaking-learing-for-a-changing-world": "chapters/chapter-2-remaking-learning.md",
    "note-taking-advantage-of-connected-learning-opportunities": "chapters/note-mimi-ito.md",
    "chapter-3-the-learning-network": "chapters/chapter-3-learning-network.md",
    "essay-how-networks-can-transform-learning": "chapters/essay-mark-surman.md",
    "chapter-4-network-support-strategies": "chapters/chapter-4-network-support-strategies.md",
    "chapter-5-lessons-learned": "chapters/chapter-5-lessons-learned.md",
    "chapter-6-the-road-ahead": "chapters/chapter-6-road-ahead.md",
}
CASE_FILE_OVERRIDES = {"maker-party": "case-studies/maker-parties.md"}
ACTION_AREAS = ["convene", "catalyze", "communicate", "coordinate", "champion"]

# ---------------------------------------------------------------- helpers


def classes(el):
    return el.get("class", "").split()


def has_class(el, name):
    return name in classes(el)


def text_of(el):
    """Plain text of an element, whitespace collapsed."""
    return re.sub(r"\s+", " ", "".join(el.itertext())).strip()


def esc(s):
    s = re.sub(r"\s+", " ", s)
    return re.sub(r"([*_\[\]`\\])", r"\\\1", s)


def slugify(heading):
    """GitHub-style anchor for a heading's text."""
    s = heading.lower()
    s = re.sub(r"[^\w\s-]", "", s)
    return re.sub(r"\s+", "-", s.strip())


def find_download(href):
    """Map a dead downloads.sproutfund.org URL to a file in docs/downloads."""
    if "downloads.sproutfund.org" not in href:
        return None
    base = href.rsplit("/", 1)[-1]
    hits = [p for p in DOWNLOADS.rglob("*") if p.is_file() and p.name == base]
    if not hits and "advocacy-kit_" in base:
        suffix = base.split("advocacy-kit_", 1)[1]
        hits = [
            p
            for p in DOWNLOADS.rglob("*")
            if p.is_file() and p.name == f"remake-learning-playbook_advocacy-kit_{suffix}"
        ]
    return hits[0] if hits else None


class Ctx:
    """Per-output-file state: where the file lives, ids seen, cross links."""

    def __init__(self, out_path, level_map=None):
        self.out = ROOT / out_path
        depth = len(Path(out_path).parts) - 1
        self.rel = "../" * depth  # prefix to reach the repo root
        self.ids = {}  # element id -> heading text
        self.level_map = level_map or {}

    def link(self, href):
        href = html.unescape(href)
        if href.startswith("#"):
            return href  # resolved in finish()
        m = re.match(r"(playbook|case-studies|plays-in-detail)\.html#(.+)", href)
        if m:
            page, frag = m.groups()
            if page == "plays-in-detail":
                if frag in ACTION_AREAS:
                    return f"{self.rel}plays/{frag}.md"
                return f"{self.rel}plays-in-detail.md"
            if page == "case-studies":
                return f"{self.rel}{CASE_FILE_OVERRIDES.get(frag, f'case-studies/{frag}.md')}"
            if page == "playbook" and frag in CHAPTER_FILES:
                return f"{self.rel}{CHAPTER_FILES[frag]}"
            return f"{self.rel}{page}.md"
        if href.startswith("downloads/"):
            return f"{self.rel}docs/{href}"
        local = find_download(href)
        if local:
            return self.rel + local.relative_to(ROOT).as_posix()
        return href

    def image(self, path_under_docs_images):
        return f"{self.rel}docs/images/{path_under_docs_images}"

    def heading(self, level, text, el_id=None):
        if el_id:
            self.ids[el_id] = text
        return "#" * level + " " + text

    def finish(self, md):
        for el_id, text in self.ids.items():
            md = md.replace(f"](#{el_id})", f"](#{slugify(text)})")
        return md


# ------------------------------------------------------------ inline HTML


def inline(el, ctx, italic=False, bold=False):
    """Render an element's text and children as inline Markdown."""
    out = [esc(el.text or "")]
    for child in el:
        out.append(inline_node(child, ctx, italic, bold))
        out.append(esc(child.tail or ""))
    return "".join(out)


def pad(s):
    """Split leading/trailing whitespace off inline content so markers hug the text."""
    core = s.strip()
    if not core:
        return "", "", ""
    return (" " if s[:1].isspace() else ""), core, (" " if s[-1:].isspace() else "")


def inline_node(el, ctx, italic=False, bold=False):
    tag = el.tag
    if tag == "a":
        href = el.get("href")
        lead, label, trail = pad(inline(el, ctx, italic, bold))
        if not href:
            return lead + label + trail
        return f"{lead}[{label}]({ctx.link(href)}){trail}" if label else ""
    if tag in ("strong", "b"):
        lead, inner, trail = pad(inline(el, ctx, italic, True))
        return lead + (inner if bold or not inner else f"**{inner}**") + trail
    if tag in ("em", "i"):
        if tag == "i" and any(c.startswith("fa") for c in classes(el)):
            return ""  # Font Awesome icon
        lead, inner, trail = pad(inline(el, ctx, True, bold))
        return lead + (inner if italic or not inner else f"*{inner}*") + trail
    if tag == "br":
        return "  \n"
    if tag == "img":
        src = el.get("src") or el.get("data-src") or ""
        alt = esc(el.get("alt") or el.get("title") or "")
        return f"![{alt}]({src})"
    if tag == "iframe":
        return iframe_link(el)
    if tag == "span" and has_class(el, "visible-xs-inline"):
        return ""  # responsive hyphen in "Acknowledge-ments"
    if tag == "sup":
        return inline(el, ctx, italic, bold)
    return inline(el, ctx, italic, bold)  # abbr, span, small, cite, ...


def iframe_link(el):
    src = html.unescape(el.get("data-src") or el.get("src") or "")
    if "soundcloud" in src:
        return f"[Listen on SoundCloud]({src})"
    if "vimeo" in src:
        return f"[Watch on Vimeo]({src})"
    return f"[Embedded content]({src})" if src else ""


# ------------------------------------------------------------- block HTML

BLOCK_TAGS = {"p", "ul", "ol", "blockquote", "hr", "h1", "h2", "h3", "h4", "h5", "h6", "div", "section", "article", "header", "aside", "img", "iframe", "table"}


def is_block(el):
    return el.tag in BLOCK_TAGS


def paragraph(el, ctx):
    lead = has_class(el, "lead")
    txt = inline(el, ctx, italic=lead).strip()
    if not txt:
        return None
    return f"*{txt}*" if lead else txt


def blocks(el, ctx):
    """Render an element's block-level children (and stray text) to a list of Markdown blocks."""
    out = []
    pending_names = []  # bare-text grid columns collapse into a list

    def flush():
        if pending_names:
            out.append("\n".join(f"- {n}" for n in pending_names))
            pending_names.clear()

    lead_text = (el.text or "").strip()
    if lead_text and not any(is_block(c) for c in el):
        # container holding inline content only (panel bodies, grid cells)
        txt = inline(el, ctx).strip()
        return [txt] if txt else []
    if lead_text:
        out.append(esc(lead_text))

    for child in el:
        tag = child.tag
        if tag == "div" and any(c.startswith("col-") for c in classes(child)) and len(child) == 0:
            name = esc((child.text or "").strip())
            if name:
                pending_names.append(name)
            continue
        flush()
        out.extend(block(child, ctx))
        tail = (child.tail or "").strip()
        if tail:
            out.append(esc(tail))
    flush()
    return [b for b in out if b]


def block(el, ctx):
    tag = el.tag
    if tag == "p":
        p = paragraph(el, ctx)
        return [p] if p else []
    if tag in ("h1", "h2", "h3", "h4", "h5", "h6"):
        level = ctx.level_map.get(int(tag[1]), int(tag[1]))
        text = inline(el, ctx).strip()
        return [ctx.heading(level, text, el.get("id"))] if text else []
    if tag in ("ul", "ol"):
        items = []
        for i, li in enumerate(el.findall("li"), 1):
            marker = f"{i}." if tag == "ol" else "-"
            items.append(f"{marker} {inline(li, ctx).strip()}")
        return ["\n".join(items)] if items else []
    if tag == "blockquote":
        return [quote(el, ctx)]
    if tag == "hr":
        return ["---"]
    if tag in ("img", "iframe"):
        return [inline_node(el, ctx)]
    if tag == "div" and has_class(el, "panel"):
        return panel(el, ctx)
    if tag == "div" and has_class(el, "well"):
        inner = blocks(el, ctx)
        return ["\n>\n".join("> " + b.replace("\n", "\n> ") for b in inner)] if inner else []
    if tag == "div" and has_class(el, "block-grid-item"):
        # audio/thumbnail grids: put the heading before the embed
        heads = [c for c in el if re.fullmatch(r"h[1-6]", c.tag)]
        rest = [c for c in el if c not in heads]
        out = []
        for c in heads + rest:
            out.extend(block(c, ctx))
        return out
    if tag in ("div", "section", "article", "header", "aside"):
        return blocks(el, ctx)
    if tag == "table":
        return [ET.tostring(el, encoding="unicode")]
    # unknown element: treat as a paragraph of inline content
    txt = inline(el, ctx).strip()
    return [txt] if txt else []


def quote(el, ctx):
    lines = []
    footer = None
    if (el.text or "").strip() and not any(is_block(c) or c.tag == "footer" for c in el):
        lines.append(inline(el, ctx).strip())
    else:
        for child in el:
            if child.tag == "footer":
                footer = inline(child, ctx).strip()
            elif child.tag == "p":
                p = paragraph(child, ctx)
                if p:
                    lines.append(p)
            else:
                lines.extend(block(child, ctx))
        head = (el.text or "").strip()
        if head:
            lines.insert(0, esc(head))
    body = "\n>\n".join("> " + l.replace("\n", "\n> ") for l in lines)
    if footer:
        body += f"\n>\n> — {footer}"
    return body


def panel(el, ctx):
    heading = el.find("div[@class='panel-heading']")
    body = el.find("div[@class='panel-body']")
    if heading is None or body is None:
        return blocks(el, ctx)
    head = inline(heading, ctx, bold=True).strip().rstrip(":")
    inner = blocks(body, ctx)
    if len(inner) == 1 and "\n" not in inner[0] and not inner[0].startswith(("#", "-", ">")):
        return [f"**{head}:** {inner[0]}"]
    return [f"**{head}**"] + inner


def join(parts):
    return "\n\n".join(p for p in parts if p) + "\n"


# --------------------------------------------------------------- chapters


def heading_levels(el):
    """Map the heading levels a chapter actually uses onto 2, 3, 4..."""
    used = sorted({int(h.tag[1]) for h in el.iter() if re.fullmatch(r"h[2-6]", h.tag)})
    return {lvl: i + 2 for i, lvl in enumerate(used)}


def chapter_title(h1):
    small = h1.find("small")
    toc = text_of(small) if small is not None else ""
    title_parts = []
    br = h1.find("br")
    if br is not None:
        title_parts.append(br.tail or "")
        for sib in list(h1)[list(h1).index(br) + 1:]:
            title_parts.append("".join(sib.itertext()) + (sib.tail or ""))
    title = re.sub(r"\s+", " ", "".join(title_parts)).strip() or text_of(h1)
    if not toc:
        return title
    if toc.lower().endswith(" to"):
        return f"{toc} {title}"
    return f"{toc}: {title}"


def export_chapter(ch):
    cid = ch.get("id")
    out_path = CHAPTER_FILES[cid]
    ctx = Ctx(out_path, heading_levels(ch))
    header = ch.find("header")
    h1 = header.find("h1")
    parts = [ctx.heading(1, esc(chapter_title(h1)), cid)]
    for child in header:
        if child is not h1:
            parts.extend(block(child, ctx))
    for child in ch:
        if child is header:
            continue
        parts.extend(block(child, ctx))
    medium = ch.get("medium-url")
    if medium:
        parts.append("---")
        parts.append(f"*Add your comments and feedback about this chapter on [Medium]({medium}).*")
    write(ctx, join(parts))
    return out_path, chapter_title(h1)


def export_root_section(el, out_path, title_override=None):
    ctx = Ctx(out_path)
    parts = []
    for child in el:
        parts.extend(block(child, ctx))
    if title_override and parts and parts[0].startswith("# "):
        parts[0] = "# " + title_override
    write(ctx, join(parts))
    return out_path


# ------------------------------------------------------------------ cases


def case_hero(slug):
    d = IMAGES / "cases" / slug
    if not d.is_dir():
        return None
    files = sorted(p.name for p in d.iterdir() if p.suffix.lower() == ".jpg")
    return files


def pick_hero(case, slug):
    files = case_hero(slug) or []
    srcs = [p.get("src", "") for p in case.findall("photos/photo") if p.get("src")]
    for src in srcs:
        base = src.rsplit(".", 1)[0]
        for cand in (f"{base}_sized1024x683.jpg", f"{base}_sized300x200.jpg"):
            if cand in files:
                return f"cases/{slug}/{cand}"
    for f in files:
        if "1024x683" in f:
            return f"cases/{slug}/{f}"
    return f"cases/{slug}/{files[0]}" if files else None


def items_list(container, ctx):
    items = []
    for item in container.findall("item"):
        txt = inline(item, ctx).strip()
        if txt:
            items.append(f"- {txt}")
    return "\n".join(items)


def export_case(case):
    slug = case.get("slug")
    if not slug:
        return None
    out_path = CASE_FILE_OVERRIDES.get(slug, f"case-studies/{slug}.md")
    ctx = Ctx(out_path)
    name = text_of(case.find("name"))
    title = inline(case.find("title"), ctx).strip()
    parts = [ctx.heading(1, f"{esc(name)}: {title}", slug)]

    vimeo = case.find("vimeo")
    vimeo_url = vimeo.get("url") if vimeo is not None else None
    hero = pick_hero(case, slug)
    if hero:
        img = f"![{esc(name)}]({ctx.image(hero)})"
        parts.append(f"[{img}]({vimeo_url})" if vimeo_url else img)
    if vimeo_url:
        parts.append(f"*Watch the video: [{esc(name)} on Vimeo]({vimeo_url})*")

    teaser = case.find("teaser")
    if teaser is not None:
        t = inline(teaser, ctx, italic=True).strip()
        if t:
            parts.append(f"*{t}*")

    text = case.find("text")
    if text is not None:
        parts.extend(blocks(text, ctx))
        author = (text.get("author") or "").strip()
        if author:
            parts.append(f"*by {esc(author)}*")

    add = case.find("additional_content")
    if add is not None:
        btn = add.find("by_the_numbers")
        if btn is not None and text_of(btn):
            parts.append(ctx.heading(2, "By the Numbers"))
            parts.extend(blocks(btn, ctx))

        nias = [n for n in add.findall("network_in_action") if text_of(n) or n.get("summary")]
        if nias:
            parts.append(ctx.heading(2, "Network in Action"))
            for nia in nias:
                summary = esc(html.unescape(nia.get("summary") or ""))
                area = (nia.get("action_area") or "").capitalize()
                label = summary + (f" ({area})" if area else "")
                if label.strip():
                    parts.append(f"**{label.strip()}**")
                parts.extend(blocks(nia, ctx))

        people = add.findall("person_of_interest")
        if people:
            parts.append(ctx.heading(2, "Persons of Interest" if len(people) > 1 else "Person of Interest"))
            for person in people:
                pname = person.get("name") or ""
                pslug = person.get("slug") or ""
                parts.append(ctx.heading(3, esc(pname)))
                headshot = IMAGES / "headshots" / f"{pslug}_300x200.jpg"
                if pslug and headshot.exists():
                    parts.append(f"![{esc(pname)}]({ctx.image(f'headshots/{pslug}_300x200.jpg')})")
                parts.extend(blocks(person, ctx))

        info = add.find("for_more_info")
        lists = [
            ("Downloadable Materials", add.find("downloadable_materials")),
            ("Online Resources", add.find("online_resources")),
            ("Related Projects & Partners", add.find("related_projects_partners")),
        ]
        has_lists = any(l is not None and l.findall("item") for _, l in lists)
        if (info is not None and text_of(info)) or has_lists:
            parts.append(ctx.heading(2, "More Information"))
            if info is not None:
                parts.extend(blocks(info, ctx))
            for label, l in lists:
                if l is not None and l.findall("item"):
                    parts.append(ctx.heading(3, label))
                    parts.append(items_list(l, ctx))

    medium = case.find("medium")
    if medium is not None and medium.get("url"):
        parts.append("---")
        parts.append(f"*Add your comments and feedback about this case on [Medium]({medium.get('url')}).*")
    write(ctx, join(parts))
    teaser_text = text_of(teaser) if teaser is not None else ""
    return out_path, name, title, teaser_text


# ------------------------------------------------------------------ plays


def export_play_group(group):
    area = group.get("action_area")
    out_path = f"plays/{area}.md"
    ctx = Ctx(out_path)
    name = text_of(group.find("name"))
    parts = [ctx.heading(1, esc(name), area)]
    teaser = group.find("teaser")
    teaser_text = ""
    if teaser is not None and text_of(teaser):
        teaser_text = text_of(teaser)
        parts.append(f"*{inline(teaser, ctx, italic=True).strip()}*")

    questions = [q for tq in group.findall("thinking_questions") for q in tq.findall("question")]
    if questions:
        parts.append(ctx.heading(2, "Thinking Questions"))
        parts.append(
            "\n".join(
                f"- **{inline(q.find('question_heading'), ctx, bold=True).strip()}**: "
                f"{inline(q.find('question_details'), ctx).strip()}"
                for q in questions
            )
        )

    plays = []
    for play in group.findall("play"):
        pslug = play.get("slug")
        pname = text_of(play.find("name"))
        plays.append((pslug, pname))
        parts.append(ctx.heading(2, esc(pname), f"{area}-{pslug}"))
        excerpt = play.find("excerpt")
        if excerpt is not None and text_of(excerpt):
            parts.append(inline(excerpt, ctx).strip())
        play_questions = play.findall("thinking_questions/question")
        if play_questions:
            parts.append(ctx.heading(3, "Thinking Questions"))
            parts.append(
                "\n".join(
                    f"- **{inline(q.find('question_heading'), ctx, bold=True).strip()}**: "
                    f"{inline(q.find('question_details'), ctx).strip()}"
                    for q in play_questions
                )
            )
        advice = play.findall("getting_started/advice")
        if advice:
            parts.append(ctx.heading(3, "Getting Started"))
            parts.append(
                "\n".join(
                    f"- **{inline(a.find('advice_heading'), ctx, bold=True).strip()}**: "
                    f"{inline(a.find('advice_details'), ctx).strip()}"
                    for a in advice
                )
            )
        examples = play.findall("examples/example")
        if examples:
            parts.append(ctx.heading(3, "Examples"))
            parts.append(
                "\n".join(
                    f"- **{inline(e.find('name'), ctx, bold=True).strip()}**: "
                    + " ".join(inline(d, ctx).strip() for d in e.findall("description"))
                    for e in examples
                )
            )
    write(ctx, join(parts))
    return out_path, name, teaser_text, plays


# ---------------------------------------------------------- landing pages


def write(ctx, md):
    ctx.out.parent.mkdir(parents=True, exist_ok=True)
    ctx.out.write_text(ctx.finish(md), encoding="utf-8")


def write_landing(out_path, title, intro, rows):
    ctx = Ctx(out_path)
    parts = [ctx.heading(1, title)]
    if intro:
        parts.append(intro)
    parts.append("\n".join(rows))
    write(ctx, join(parts))


# ------------------------------------------------------------------- main


def main():
    playbook = ET.parse(SRC / "playbook.xml").getroot()
    cases = ET.parse(SRC / "case-studies.xml").getroot()
    plays = ET.parse(SRC / "plays-in-detail.xml").getroot()
    written = []

    chapter_rows = []
    for ch in playbook.find("chapters").findall("chapter"):
        path, title = export_chapter(ch)
        written.append(path)
        chapter_rows.append(f"* [{esc(title)}]({path})")
    write_landing("chapters.md", "Chapters", None, chapter_rows)
    written.append("chapters.md")

    case_rows = []
    for case in cases.findall("case"):
        result = export_case(case)
        if result:
            path, name, title, teaser = result
            written.append(path)
            case_rows.append(f"* [{esc(name)}]({path}): {title}" + (f" — {esc(teaser)}" if teaser else ""))
    write_landing("case-studies.md", "Case Studies", None, case_rows)
    written.append("case-studies.md")

    play_rows = []
    for group in plays.findall("plays_group"):
        path, name, teaser, group_plays = export_play_group(group)
        written.append(path)
        play_rows.append(f"* [{esc(name)}]({path}): {esc(teaser)}")
        for pslug, pname in group_plays:
            play_rows.append(f"  * [{esc(pname)}]({path}#{slugify(pname)})")
    write_landing("plays-in-detail.md", "Plays in Detail", None, play_rows)
    written.append("plays-in-detail.md")

    ar = playbook.find("additional-resources")
    if ar is not None:
        written.append(export_root_section(ar, "additional-resources.md"))
    ack = playbook.find("acknowledgements")
    if ack is not None:
        written.append(export_root_section(ack, "acknowledgements.md"))

    for p in written:
        print(p)
    print(f"{len(written)} files written", file=sys.stderr)


if __name__ == "__main__":
    main()
