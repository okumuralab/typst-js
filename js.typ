// Template based on LaTeX jsarticle/jsbook

#let js(
  lang: "ja",
  textfont: ("New Computer Modern", "Hiragino Mincho ProN", "Yu Mincho"),
  sansfont: ("Arial", "Hiragino Kaku Gothic ProN", "Yu Gothic"),
  paper: "a4", // "a*", "b*", or (paperwidth, paperheight) e.g. (210mm, 297mm)
  fontsize: 10pt,
  baselineskip: auto,
  textwidth: auto,
  lines-per-page: auto,
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
  let ymargin = if lines-per-page == auto {
    (paperheight - (int((0.83 * paperheight - fontsize) / baselineskip)
                    * baselineskip + fontsize)) / 2
  } else {
    (paperheight - (baselineskip * (lines-per-page - 1) + fontsize)) / 2
  }
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
    numbering: "1",
    footer: if book { none } else { auto },
    header:
      if not book { auto } else {
        context {
          let n = if page.numbering == none { "" } else {
            counter(page).display(page.numbering)  // logical page number
          }
          let p = here().page()  // physical page number
          let h1 = heading.where(level: 1)
          let h1p = query(h1).map(it => it.location().page())
          if p > 1 and not p in h1p {
            if calc.odd(p) {
              let h2 = heading.where(level: 2)
              let h2last = query(h2.before(here())).at(-1, default: none)
              let h2next = query(h2.after(here())).at(0, default: none)
              if h2next != none and h2next.location().page() == p { h2last = h2next }
              if h2last != none {
                let c = counter(heading).at(h2last.location())
                stack(
                  spacing: 0.2em,
                  if h2last.numbering == none {
                    [ #h2last.body #h(1fr) #n ]
                  } else {
                    [ #{c.at(0)}.#{c.at(1)}#h(1em)#h2last.body #h(1fr) #n ]
                  },
                  line(stroke: 0.4pt, length: 100%),
                )
              }
            } else {
              let h1last = query(h1.before(here())).at(-1, default: none)
              let h1next = query(h1.after(here())).at(0, default: none)
              if h1next != none and h1next.location().page() == p { h1last = h1next }
              if h1last != none {
                let c = counter(heading).at(h1last.location())
                stack(
                  spacing: 0.2em,
                  if h1last.numbering == none {
                    [ #n #h(1fr) #h1last.body ]
                  } else {
                    [ #n #h(1fr) 第#{c.at(0)}章#h(1em)#h1last.body ]
                  },
                  line(stroke: 0.4pt, length: 100%),
                )
              }
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
    first-line-indent: (amount: 1em, all: true),  // Typst 0.13
    justify: true,
    spacing: baselineskip - 0.88em, // 段落間
    leading: baselineskip - 0.88em, // 行間
  )
  set heading(numbering: "1.1")
  show heading: set text(font: sansfont, weight: 450)
  show heading: it => {
    v(baselineskip, weak: true)
    it
    // par("")
    v(0.2 * baselineskip)
  }
  show heading.where(level: 1): it => {
    set par(first-line-indent: 0em, spacing: 2.5 * fontsize, leading: 1.3 * fontsize)
    if book {
      pagebreak(weak: true, to: "odd")
      v(2 * baselineskip)
      if it.numbering != none {
        let n = counter(heading).get().at(0, default: 0)
        text(2 * fontsize, "第" + str(n) + "章")
        linebreak()
      }
      text(size: 2.5 * fontsize, it.body)
      v(2 * baselineskip)
    } else {
      v(2 * baselineskip, weak: true)
      text(1.4 * fontsize, it)
    }
  }
  show heading.where(level: 2): it => {
    text(if book { 1.4 } else { 1.2 } * fontsize, it)
  }
  set list(indent: 1.2em)
  show strong: set text(font: sansfont, weight: 450)
  set quote(block: true)
  show quote.where(block: true): set pad(left: 2em)
  show quote.where(block: true): set block(spacing: 1.5 * baselineskip - 0.88em)
  show list: set block(spacing: 1.5 * baselineskip - 0.88em)
  show enum: set block(spacing: 1.5 * baselineskip - 0.88em)
  set terms(indent: 2em, separator: h(1em, weak: true))
  set enum(indent: 0.722em)
  set list(indent: 0.722em)
  show terms: set block(spacing: 1.5 * baselineskip - 0.88em)
  show raw.where(block: true): set block(width: 100%, fill: luma(240), inset: 1em)
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

#let kintou(width, s) = box(width: width, s.text.clusters().join(h(1fr)))
#let scatter(s) = h(1fr) + s.text.clusters().join(h(2fr)) + h(1fr)
#let ruby(yomi, kanji) = box[
  #context {
    set par(first-line-indent: 0em)
    let w = measure(yomi).width / 2
    let x = measure(kanji).width
    if w < x { w = x }
    box(width: w, h(1fr) + kanji + h(1fr)) // or scatter(kanji)
    place(top + center, dy: -0.5em, box(width: w, text(0.5em, scatter(yomi))))
  }
]

#let noindent(body) = {
  set par(first-line-indent: 0em)
  body
}

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
  date: datetime.today().display("[year]年[month repr:numerical padding:none]月[day padding:none]日"),
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
