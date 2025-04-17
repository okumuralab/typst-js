# Typst template based on LaTeX jsarticle/jsbook

LaTeXのjsarticle/jsbookっぽいTypstテンプレートです。Typst 0.13用です。ライセンスはMIT-0（実質パブリックドメイン）としましたのでご自由に修正してお使いください。

Typst Universeに入れていただきました。ターミナルに

```
typst init @preview/js:0.1.3
```

と打ち込むと、カレントディレクトリに `js` というフォルダができますので、その中に入って

```
typst compile example.typ
```

として、できた `example.pdf` をご覧ください。

フォントはWeb版Typstでうまくいくような初期設定になっています。うまくいかなければ、`example.typ` 先頭部分のフォント指定を適当に書き直してください。コマンド版Typstなら、`typst fonts` と打ち込めば、使えるフォント名の一覧が出力されますので、その中から選んでください。Macなら

```
  seriffont-cjk: "Hiragino Mincho ProN",
  sansfont: "Helvetica",
  sansfont-cjk: "Hiragino Kaku Gothic ProN",
```

Windowsなら

```
  seriffont-cjk: "Yu Mincho",
  sansfont: "Arial",
  sansfont-cjk: "Yu Gothic",
```

あたりでうまくいくのではないかと思います。新しいWindows 11なら日本語は `Noto Serif JP`、`Noto Sans JP` が良さそうだと思ったのですが [新しいWindowsのNoto JPフォントをTypstやLaTeXで使う（使えない）件](https://zrbabbler.hatenablog.com/entry/2025/04/14/234338) という問題があるようです。

TeX Liveがインストールされているなら、そのOpenTypeディレクトリをTypstのフォントサーチパスに加えてください。例えば

```
export TYPST_FONT_PATHS=/usr/local/texlive/2025/texmf-dist/fonts/opentype
```

のようにします。これなら js のデフォルトのままで大丈夫です。

## What's New

[2025-04-07] 同趣向のテンプレート [jcls-typst](https://github.com/tkrhsmt/jcls-typst) があることを教えていただきました。例の [Adobe Blankによるゴースト](https://qiita.com/zr_tex8r/items/a9d82669881d8442b574) も使ってあり、参考になります。

[2025-03-25] `set ref(supplement: none)` でいいのではというご教示をいただきましたので、そちらに直しました。ありがとうございます。で、Typst Universeにプルリクしたら、その日のうちに 0.1.3 として登録されました。

[2025-03-24] [図と表が混在する場合にrefで出力される番号が不正になる #1](https://github.com/okumuralab/typst-js/issues/1) に対応したところ、今度は [リファレンスが機能しない #2](https://github.com/okumuralab/typst-js/issues/2) というバグが生じていました。ググったら [これ](https://forum.typst.app/t/how-to-correctly-customize-equation-numbering-referencing-simultaneously/2485) を見つけました。全然きれいでないですが、これしかないんでしょうか。あるいはこの機能を諦めるか。とりあえずこちらのリポジトリでは以下のようにしてみました。

```
  show ref: it => { // remove 節, 式 etc and spaces from references
    let el = it.element
    if el != none {
      show regex("\p{letter}+\s+"): none
      it
    } else {
      it
    }
  }
```

[2025-03-06] ↓の事情で1日遅れましたが0.1.2がTypst Universeに入りました。

[2025-03-05] [図と表が混在する場合にrefで出力される番号が不正になる #1](https://github.com/okumuralab/typst-js/issues/1) に対処しました。ありがとうございます。数文字違いなので0.1.1のままでプルリクしたら、少しでもコードが変われば0.1.2にしてくれとのことで、この修正は0.1.2になります。

[2025-03-03] バージョン0.1.1がTypst Universeに入りました。

[2025-03-01] bookでない場合に、見出しが行送りの整数倍になるように調整しました（うまくいっているでしょうか）。まだTypst Universe版は直していません。

[2025-02-24] Typst Universeに入ったようです。

[2025-02-22] Typst Universeにプルリクしてみました。

[2025-02-20] オプション名に付く `-ja` を `-cjk` にしました。オプション `cjkheight: 0.88` を追加しました。

[2025-02-19] 見出しのスペーシングを微調整。

[2025-02-18] 見出しの実装を全面的に見直しました。見出し前後の空きの量は悩ましいところですので適宜修正してください。あと、What's Newの日付が1年ずれていたのを修正しました。

[2025-02-14] 日本語以外を表す正規表現を設定できるようにしました。文字列 `"latin-in-cjk"` を設定するとTypstのデフォルトになります。

[2025-02-11] Typst 0.13は日本語の扱いがかなり改良されており、0.12に固執する意味はなさそうなので、マージしてTypst 0.13用に一本化しました。

[2025-02-10] `#ruby[親文字][読み]` の順序がLaTeXの一般的なマクロと逆になっていたのを正しました。

[2025-02-10] 和文ゴシック体が2ウェイトあれば、`*強い強調*` はボールド、`_強調_` はレギュラーになるはずです。見出しはレギュラーに統一しました（はずです）。

[2025-02-10] フォント指定のしかたを変えました。ありそうなフォントを並べる方式は警告が出るので、和欧それぞれ一つずつ指定する方式にしました。デフォルトはWeb版Typstにある原ノ味フォントとNew Computer Modern、Source Sans Proにしました。これらはTeX Liveに含まれていますが、ない場合は HaranoAjiMincho-Regular、HaranoAjiGothic-(Regular,Bold)、SourceSansPro-(Regular,Bold)[It] くらいを入れておけば便利です。
