# Typst template based on LaTeX jsarticle/jsbook

LaTeXのjsarticle/jsbookっぽいTypstテンプレートです。

とりあえず `js.typ` と `example.typ` を同じディレクトリに入れて

```
typst compile example.typ
```

として、できた `example.pdf` をご覧ください。

こちらのブランチではTypst 0.13に対応中です。

[2024-02-10] フォント指定のしかたを変えました。ありそうなフォントを並べる方式は警告が出るので、和欧それぞれ一つずつ指定する方式にしました。デフォルトはWeb版Typstにある原ノ味フォントとNew Computer Modern、Source Sans Proにしました。これらはTeX Liveに含まれていますが、ない場合は HaranoAjiMincho-Regular、HaranoAjiGothic-(Regular,Bold)、SourceSansPro-(Regular,Bold)[It] くらいを入れておけば便利です。

[2024-02-10] 和文ゴシック体が2ウェイトあれば、`*強い強調*` はボールド、`_強調_` はレギュラーになるはずです。見出しはレギュラーに統一しました（はずです）。

[2024-02-10] `#ruby[親文字][読み]` の順序がLaTeXの一般的なマクロと逆になっていたのを正しました。
