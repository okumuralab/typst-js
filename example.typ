#import "js.typ": *
#import "@preview/roremu:0.1.0": roremu

#show: js.with(
  lang: "ja",
  seriffont: "New Computer Modern",
  seriffont-ja: "Harano Aji Mincho",
  sansfont: "Source Sans Pro",
  sansfont-ja: "Harano Aji Gothic",
  paper: "a4", // "a*", "b*", or (paperwidth, paperheight) e.g. (210mm, 297mm)
  fontsize: 10pt,
  baselineskip: auto,
  textwidth: auto,
  lines-per-page: auto,
  book: false, // or true
  cols: 1, // or 2, 3, ...
)

#maketitle(
  title: "Typst日本語用テンプレートjs.typ",
  authors: "奥村 晴彦",
  // authors: ("奥村 晴彦", "何野 何某"),
  // authors: (("奥村 晴彦", "三重大"), ("何野 何某", "某大")),
  // authors: (("奥村 晴彦", "三重大", "okumura@okumuralab.org"), ("何野 何某", "某大")),
  abstract: [
    p#LaTeX のjsarticle/jsbookに基づくTypstテンプレート（作りかけ）。
  ]
)

= これは何？

Typst日本語用テンプレートです。p#LaTeX のjsarticle/jsbook相当品のつもりです。簡単なマクロもいくつか含めています。例：

```
#kintou(5em)[ほげ]
```

#quote[
  #kintou(5em)[ほげ]
]

```
とある#ruby[科][か]#ruby[学][がく]の#ruby[超電磁砲][レールガン]
```

#quote[
  とある#ruby[科][か]#ruby[学][がく]の#ruby[超電磁砲][レールガン]
]
