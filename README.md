# Typst template based on LaTeX jsarticle/jsbook

LaTeXのjsarticle/jsbookっぽいTypstテンプレートです。Typst 0.13用です。ライセンスはMIT-0（実質パブリックドメイン）としましたのでご自由に修正してお使いください。

とりあえず `js.typ` と `template/example.typ` を同じディレクトリに入れて

```
typst compile example.typ
```

として、できた `example.pdf` をご覧ください。

## What's New

[2025-02-22] Typst Universeにプルレクしてみました。

[2025-02-20] オプション名に付く `-ja` を `-cjk` にしました。オプション `cjkheight: 0.88` を追加しました。

[2025-02-19] 見出しのスペーシングを微調整。

[2025-02-18] 見出しの実装を全面的に見直しました。見出し前後の空きの量は悩ましいところですので適宜修正してください。あと、What's Newの日付が1年ずれていたのを修正しました。

[2025-02-14] 日本語以外を表す正規表現を設定できるようにしました。文字列 `"latin-in-cjk"` を設定するとTypstのデフォルトになります。

[2025-02-11] Typst 0.13は日本語の扱いがかなり改良されており、0.12に固執する意味はなさそうなので、マージしてTypst 0.13用に一本化しました。

[2025-02-10] `#ruby[親文字][読み]` の順序がLaTeXの一般的なマクロと逆になっていたのを正しました。

[2025-02-10] 和文ゴシック体が2ウェイトあれば、`*強い強調*` はボールド、`_強調_` はレギュラーになるはずです。見出しはレギュラーに統一しました（はずです）。

[2025-02-10] フォント指定のしかたを変えました。ありそうなフォントを並べる方式は警告が出るので、和欧それぞれ一つずつ指定する方式にしました。デフォルトはWeb版Typstにある原ノ味フォントとNew Computer Modern、Source Sans Proにしました。これらはTeX Liveに含まれていますが、ない場合は HaranoAjiMincho-Regular、HaranoAjiGothic-(Regular,Bold)、SourceSansPro-(Regular,Bold)[It] くらいを入れておけば便利です。
