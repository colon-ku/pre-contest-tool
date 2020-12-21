#!/bin/zsh
PART=$1

KEY='Link to the Problem'
LF=$'\n'

# ABC19までは問題へのリンクの様式が異なる
ORIG=19

# コマンドライン引数を指定しない場合は全ファイルについて適用
if [ "xxxxx$PART" = "xxxxx" ] ; then
for file in `\find . -maxdepth 2 -type f -name "*.cpp"` ; do
    # ファイルへのパスは ./001/a.cpp のような形で得られる

    base="$(basename $file)"
    dir="${$(dirname $file):2}"

    if grep -q $KEY $file ; then
        editted='true'
    else
        editted='false'
    fi

    # 問題へのリンクを生成
    lk='void'

    if [ "$dir" -le "$ORIG" ] ; then
        case $base in
            "a.cpp" ) lk="https://atcoder.jp/contests/abc${dir}/tasks/abc${dir}_1" ;;
            "b.cpp" ) lk="https://atcoder.jp/contests/abc${dir}/tasks/abc${dir}_2" ;;
            "c.cpp" ) lk="https://atcoder.jp/contests/abc${dir}/tasks/abc${dir}_3" ;;
            "d.cpp" ) lk="https://atcoder.jp/contests/abc${dir}/tasks/abc${dir}_4" ;;
        esac
    else
        case $base in
            "a.cpp" ) lk="https://atcoder.jp/contests/abc${dir}/tasks/abc${dir}_a" ;;
            "b.cpp" ) lk="https://atcoder.jp/contests/abc${dir}/tasks/abc${dir}_b" ;;
            "c.cpp" ) lk="https://atcoder.jp/contests/abc${dir}/tasks/abc${dir}_c" ;;
            "d.cpp" ) lk="https://atcoder.jp/contests/abc${dir}/tasks/abc${dir}_d" ;;
            "e.cpp" ) lk="https://atcoder.jp/contests/abc${dir}/tasks/abc${dir}_e" ;;
            "f.cpp" ) lk="https://atcoder.jp/contests/abc${dir}/tasks/abc${dir}_f" ;;
        esac
    fi

    # 問題へのリンクが生成されたら、ソースコードに生成されたリンクを貼り付ける
    if [ $editted = 'false' ] ; then
        if [ $lk != 'void' ] ; then
            gsed -i -e "1i // $KEY" $file
            gsed -i -e "2i // $lk" $file
            gsed -i -e "3i$LF" $file
        fi
    fi
done

else    # コマンドライン引数を指定した場合は部分適用

for file in `\find "./${PART}/" -maxdepth 2 -type f -name "*.cpp"` ; do
    # ファイルへのパスは ./001/a.cpp のような形で得られる

    base="$(basename $file)"
    dir="${$(dirname $file):2}"

    if grep -q $KEY $file ; then
        editted='true'
    else
        editted='false'
    fi

    # 問題へのリンクを生成
    lk='void'

    if [ "$dir" -le "$ORIG" ] ; then
        case $base in
            "a.cpp" ) lk="https://atcoder.jp/contests/abc${dir}/tasks/abc${dir}_1" ;;
            "b.cpp" ) lk="https://atcoder.jp/contests/abc${dir}/tasks/abc${dir}_2" ;;
            "c.cpp" ) lk="https://atcoder.jp/contests/abc${dir}/tasks/abc${dir}_3" ;;
            "d.cpp" ) lk="https://atcoder.jp/contests/abc${dir}/tasks/abc${dir}_4" ;;
        esac
    else
        case $base in
            "a.cpp" ) lk="https://atcoder.jp/contests/abc${dir}/tasks/abc${dir}_a" ;;
            "b.cpp" ) lk="https://atcoder.jp/contests/abc${dir}/tasks/abc${dir}_b" ;;
            "c.cpp" ) lk="https://atcoder.jp/contests/abc${dir}/tasks/abc${dir}_c" ;;
            "d.cpp" ) lk="https://atcoder.jp/contests/abc${dir}/tasks/abc${dir}_d" ;;
            "e.cpp" ) lk="https://atcoder.jp/contests/abc${dir}/tasks/abc${dir}_e" ;;
            "f.cpp" ) lk="https://atcoder.jp/contests/abc${dir}/tasks/abc${dir}_f" ;;
        esac
    fi

    # 問題へのリンクが生成されたら、ソースコードに生成されたリンクを貼り付ける
    if [ $editted = 'false' ] ; then
        if [ $lk != 'void' ] ; then
            gsed -i -e "1i // $KEY" $file
            gsed -i -e "2i // $lk" $file
            gsed -i -e "3i$LF" $file
        fi
    fi
done
fi