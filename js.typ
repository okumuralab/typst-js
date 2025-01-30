// Template based on LaTeX jsarticle/jsbook

#let js(
  lang: "ja",
  textfont: ("New Computer Modern", "Harano Aji Mincho"),
  sansfont: ("Source Sans Pro", "Harano Aji Gothic"),
  paper: "a4", // "a*", "b*", or (paperwidth, paperheight) e.g. (210mm, 297mm)
  fontsize: 10pt,
  baselineskip: auto,
  textwidth: auto,
  lines_per_page: auto,
  book: false,
  cols: 1,
  body
) = {
  if paper == "a3" { paper = (297mm, 420mm) }
  if paper == "a4" { paper = (210mm, 297mm) }
  if paper == "a5" { paper = (148mm, 210mm) }
  if paper == "a6" { paper = (105mm, 148mm) }
  if paper == "b4" { paper = (257mm, 364mm) }
  if paper == "b5" { paper = (182mm, 257mm) }
  if paper == "b6" { paper = (128mm, 182mm) }
  let (paperwidth, paperheight) = paper
  if textwidth == auto {
    textwidth = (int(0.76 * paperwidth / (cols * fontsize)) * cols + 2 * (cols - 1)) * fontsize
  }
  if baselineskip == auto { baselineskip = 1.73 * fontsize }
  let xmargin = (paperwidth - textwidth) / 2
  let ymargin = if lines_per_page == auto {
    (paperheight - (int((0.83 * paperheight - fontsize) / baselineskip)
                    * baselineskip + fontsize)) / 2
  } else {
    (paperheight - (baselineskip * (lines_per_page - 1) + fontsize)) / 2
  }
  let h1state = state("h1state")
  set columns(gutter: 2em)
  set page(
    width: paperwidth,
    height: paperheight,
    margin: (
      x: xmargin,
      top: if book { ymargin + 0.5 * baselineskip } else { ymargin },
      bottom: if book { ymargin - 0.5 * baselineskip } else { ymargin },
    ),
    columns: cols,
    header:
      if not book { auto } else {
        context {
          let p = here().page()  // page number
          let h1 = heading.where(level: 1)
          let h1p = query(h1).map(it => it.location().page())
          if p > 1 and not p in h1p {
            if calc.odd(p) {
              stack(
                spacing: 0.2em,
                [ #h1state.get() #h(1fr) #str(p) ],
                line(stroke: 0.4pt, length: 100%),
              )
            } else {
              stack(
                spacing: 0.2em,
                [ #str(p) #h(1fr) #h1state.get() ],
                line(stroke: 0.4pt, length: 100%),
              )
            }
          }
        }
    },
  )
  set text(
    lang: lang,
    font: textfont,
    weight: 450,
    size: fontsize,
    top-edge: 0.88em,
  )
  set par(
    first-line-indent: 1em,
    justify: true,
    spacing: baselineskip - 0.88em, // 段落間
    leading: baselineskip - 0.88em, // 行間
  )
  set heading(numbering: "1.1   ")
  show heading: set text(font: sansfont, weight: 450)
  show heading: it => {
    v(baselineskip, weak: true)
    it
    par("")
    v(-0.8 * baselineskip)
  }
  show heading.where(level: 1): it => {
    if book {
      pagebreak(weak: true, to: "odd")
      v(2 * baselineskip)
      let n = counter(heading).get().at(0, default: 0)
      let h1 = ""
      h1 = "第" + str(n) + "章"
      h1state.update(h1 + "  " + it.body)
      par(text(2 * fontsize, h1))
      par(
        first-line-indent: 0em,
        spacing: 2.5 * fontsize,
        leading: 1.3 * fontsize,
        text(size: 2.5 * fontsize, it.body)
      )
      v(2 * baselineskip)
    } else {
      v(2 * baselineskip, weak: true)
      text(1.4 * fontsize, it)
    }
  }
  show heading.where(level: 1, numbering: none): it => {
    if book {
      pagebreak(weak: true, to: "odd")
      v(2 * baselineskip)
      let n = counter(heading).get().at(0, default: 0)
      let h1 = ""
      h1state.update(it.body)
      par(
        first-line-indent: 0em,
        spacing: 2.5 * fontsize,
        leading: 1.3 * fontsize,
        text(size: 2.5 * fontsize, it.body)
      )
      v(2 * baselineskip)
    } else {
      text(1.4 * fontsize, it)
    }
  }
  show heading.where(level: 2): it => {
    if book { text(1.4 * fontsize, it) } else { text(1.2 * fontsize, it) }
  }
  set list(indent: 1.2em)
  show strong: set text(font: sansfont, weight: 450)
  set quote(block: true)
  show quote.where(block: true): set pad(left: 2em)
  show quote.where(block: true): set block(spacing: 1.5 * baselineskip - 0.88em)
  show list: set block(spacing: 1.5 * baselineskip - 0.88em)
  show enum: set block(spacing: 1.5 * baselineskip - 0.88em)
  set terms(indent: 2em)
  set enum(indent: 1.2em)
  set list(indent: 1.7em)
  show terms: set block(spacing: 1.5 * baselineskip - 0.88em)
  show raw.where(block: true): set par(
    justify: false,
    spacing: 1.5 * baselineskip - 0.88em, // 段落間
    leading: 0.8 * baselineskip - 0.88em, // 行間
  )
  set table(stroke: 0.4pt)
  show table: set text(top-edge: 0.76em)
  set footnote.entry(indent: 1.6em)
  show figure.where(kind: table): set figure.caption(position: top)
  show ref: it => { // remove 節, 式 etc and spaces from references
    let el = it.element
    if el != none {
      link(el.location(),numbering(
        el.numbering,
        ..counter(el.func()).at(el.location())
      ).trim())
    } else {
      it
    }
  }
  // finally
  body
}

// miscellaneous definitions

#let TeX = box[T#h(-0.2em)#text(baseline: 0.2em)[E]#h(-0.1em)X]
#let LaTeX = box[L#h(-0.3em)#text(size: 0.7em, baseline: -0.3em)[A]#h(-0.1em)#TeX]

#let ruby(yomi, kanji) = box[
  #kanji
  #place(top + center, dy: -0.5em, text(0.5em, yomi))
]

#let boxtable(x) = {
  if type(x) == array {
    box(baseline: 100%-0.76em-0.4em,
        table(stroke: 0pt, inset: 0.4em, columns: 1, align: center, ..x))
  } else {
    box(x)
  }
}

#let array2text(x) = {
  while type(x) == array { x = x.at(0, default: "") }
  x
}

#let authortext(authors) = {
  if type(authors) == array {
    authors.map(array2text).join(", ")
  } else {
    authors
  }
}

#let maketitle(
  title: "",
  authors: "",
  date: datetime.today().display("[year]年[month repr:numerical padding:none]月[day]日"),
  abstract: [],
  keywords: (),
) = {
  set document(title: title, author: authortext(authors), keywords: keywords)
  place(top + center, scope: "parent", float: true)[
    #set align(center)
    #v(2em)
    #text(1.7em, title)
    #v(1.5em)
    #pad(
      x: 2em,
      if type(authors) == array {
        authors.map(boxtable).join("      ")
      } else {
        authors
      }
    )
    #v(1em)
    #date
    #v(1.5em)
    #if abstract != [] {
      block(width: 90%)[
        #set text(0.9em)
        *概要*
        #align(left)[#abstract]
      ]
      v(1.5em)
    }
  ]
}
