# Typst template based on LaTeX jsarticle/jsbook

LaTeXのjsarticle/jsbookっぽいTypstテンプレートです。

とりあえず `js.typ` と `example.typ` を同じディレクトリに入れて

```
typst compile example.typ
```

として、できた `example.pdf` をご覧ください。

`#ruby[よみ][親文字]` などの定義も含めました。

[2025-02-07] オプション `book: true` では、偶数ページのヘッダに章見出し、奇数ページのヘッダに節見出しが入るようにしました。そのページに節見出しがある場合はその最初のもの、なければそれ以前の最後の節見出しが入ります。ただし、章の開始ページではヘッダは入りません。`book: true` 以外でページ番号が出ないバグを直しました。
