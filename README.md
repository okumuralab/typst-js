# Typst template based on LaTeX jsarticle/jsbook

LaTeXのjsarticle/jsbookっぽいTypstテンプレートです。

とりあえず `js.typ` と `example.typ` を同じディレクトリに入れて

```
typst compile example.typ
```

として、できた `example.pdf` をご覧ください。

こちらのブランチではTypst 0.13に対応中です。

フォント指定のしかたを変えました。ありそうなフォントを並べる方式は警告が出るので、和欧それぞれ一つずつ指定する方式にしました。デフォルトはWeb版Typstにある原ノ味フォントとNew Computer Modern、Source Sans Proにしました。これらはTeX Liveに含まれていますが、ない場合は HaranoAjiMincho-Regular、HaranoAjiGothic-(Regular,Bold)、SourceSansPro-(Regular,Bold)[It] くらいを入れておけば便利です。
