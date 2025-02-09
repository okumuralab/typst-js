# Typst template based on LaTeX jsarticle/jsbook

LaTeXのjsarticle/jsbookっぽいTypstテンプレートです。

とりあえず `js.typ` と `example.typ` を同じディレクトリに入れて

```
typst compile example.typ
```

として、できた `example.pdf` をご覧ください。

`#ruby[よみ][親文字]` などの定義も含めました。

[2025-02-07] オプション `book: true` では、偶数ページのヘッダに章見出し、奇数ページのヘッダに節見出しが入るようにしました。そのページに節見出しがある場合はその最初のもの、なければそれ以前の最後の節見出しが入ります。ただし、章の開始ページではヘッダは入りません。`book: true` 以外でページ番号が出ないバグを直しました。

[2025-02-08] LaTeXの `\frontmatter` 相当の

```
#set heading(numbering: none)
#set page(numbering: "i")
```

`\mainmatter` 相当の

```
#pagebreak(weak: true, to: "odd")
#set heading(numbering: "1.1   ")
#counter(page).update(1)
#set page(numbering: "1")
```

などがちゃんと反映されるようにしたつもりです。

[2025-02-09] デフォルトフォントを

```
  textfont: ("New Computer Modern", "Harano Aji Mincho"),
  sansfont: ("Source Sans Pro", "Harano Aji Gothic"),
```

としていましたが、より一般的な

```
  textfont: ("New Computer Modern", "Hiragino Mincho ProN", "Yu Mincho"),
  sansfont: ("Arial", "Hiragino Kaku Gothic ProN", "Yu Gothic"),
```

に変えました（存在しなければ警告が出ますがMacでもWindowsでもどれかのフォントが存在すると思います）。
