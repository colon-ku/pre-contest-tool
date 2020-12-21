# AtCoder Beginner Contest (ABC) pre-contest tool
ABCの問題を解くときに毎回テンプレートをコピーしたりしていたのを何とか効率化できないか？と思って作ったシェルスクリプトが結構便利だったので共有しておきます。

***

## 挙動
こんなコードが

```c++:tmp.cpp
#include <iostream>
using namespace std;

int main()
{
    cout << "Hello, this is a template!" << endl;
    return 0;
}
```

こうなります。

```c++:123/a.cpp
// Link to the Problem
// https://atcoder.jp/contests/abc123/tasks/abc123_a

#include <iostream>
using namespace std;

int main()
{
    cout << "Hello, this is a template!" << endl;
    return 0;
}
```

***

## 構成
スクリプトを実行する前のディレクトリ構成は下図のようにしてください。
たとえばABC055のサブディレクトリ名が `abc055` や `55` になっていると有効なリンクが貼られません！（また気が向いたら対応できるようにしたい）

```
.
├── 055         ※ 1桁、2桁のときも0を詰めて3桁にする
│   ├── a.cpp   ※ A問題は a.cpp
│   ├── b.cpp   ※ B問題は b.cpp
│   ├── c.cpp
│   └── d.cpp
├── 120
│   ├── a.cpp
│   ├── a.out
│   ├── b.cpp
│   ├── c.cpp
│   ├── d.cpp
│   └── test.cpp
├── addurl.sh
├── make.sh
└── tmp.cpp
```

このように配置された `addurl.sh` や `make.sh` を実行するとコードに問題へのリンクを自動で貼れたり、新しくコンテスト用のサブディレクトリを作れたりします。

```console
chmod u+x addurl.sh make.sh
```

と実行してアクセス権限を与えておいてあげると便利です。

***

## 使い方
### `addurl.sh`
これは既に作ったコードにリンクを貼るためのスクリプトです。\
ディレクトリ内のコード全てにリンクを貼るためには

```
./addurl.sh
```

ABC900のサブディレクトリ内だけに適用するためには

```
./addurl.sh 900
```

と打ちます。

なおこのスクリプトは `a.cpp`, `b.cpp`, `c.cpp`, `d.cpp`, `e.cpp`, `f.cpp` 以外の名前が付けられたコードには一切手を付けません。逆に言うと、これらの名前を付けた（深さ2までの）コードにはたとえそれが不正な形で配置されていても「それっぽい」URLが貼られてしまいます。\
また、存在しないサブディレクトリを指定した場合は `find` が出してくれるエラーメッセージだけが表示されて終了します。

```
% ./addurl.sh 900
find: ./900/: No such file or directory
```

### `make.sh`
これはコンテスト用のコードを入れるサブディレクトリを作成してその中にコードを生成し、リンクまで貼るスクリプトです。\
1回 `addurl.sh` を実行して既に書いてあるコードにリンクを追加したら、こちらをコンテストの都度実行していったほうが圧倒的に便利です。

ABC900のサブディレクトリを作成するには

```
./make.sh 900
```

と打ちます。
ABC001から099までのコンテストのサブディレクトリを作成する時は、「001」と呼んでも「1」と呼んでも動きます。\
ABC001からABC999までのサブディレクトリをまとめて作成したいときは

```
for (( i = 1; i <= 999; i++ )) ; do
    ./make.sh $i
done
```

と実行すれば動きます。一応。

***

## 貼られたURLを消したい時
編集済みの印として僕が適当に付けた「Link to the Problem」が気に入らない人は、一旦貼られたURLを全部消したくなるかもしれません。そんなときは

```
zsh ./rmurl.sh
```

と実行すれば元に戻せます。