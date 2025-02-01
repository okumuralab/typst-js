#import "js.typ": *
#import "@preview/roremu:0.1.0": roremu

#show: js.with()

/*
#show: js.with(
  lang: "ja",
  textfont: ("New Computer Modern", "Harano Aji Mincho"), // or "Hiragino Mincho ProN" etc.
  sansfont: ("Source Sans Pro", "Harano Aji Gothic"), // or "Hiragino Kaku Gothic ProN" etc.
  paper: "a4", // "a*", "b*", or (paperwidth, paperheight) e.g. (210mm, 297mm)
  fontsize: 10pt,
  baselineskip: auto,
  textwidth: auto,
  lines_per_page: auto,
  book: false, // or true
  cols: 1, // or 2, 3, ...
)
*/

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
とある#ruby[か][科]#ruby[がく][学]の#ruby[レールガン][超電磁砲]
```

#quote[
  とある#ruby[か][科]#ruby[がく][学]の#ruby[レールガン][超電磁砲]
]

