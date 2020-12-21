#!/bin/zsh
dir=$1

# ABC125までは4問生成する
FOUR=125

expr "$dir" + 1 >&/dev/null
if [ $? -ge 2 ] ; then
    echo "Type the contest number of which you are participating."
    exit
fi

if [ "$dir" -le '0' ] ; then
    echo "Stay big, stay larger than zero."
    exit
fi

dir=`printf %03d $dir`
if [ -e $dir ] ; then
    echo "Directory named \"$dir\" exists."
else
    mkdir $dir
    
    if [ "$dir" -le "$FOUR" ] ; then
        cp tmp.cpp "${dir}/a.cpp"
        cp tmp.cpp "${dir}/b.cpp"
        cp tmp.cpp "${dir}/c.cpp"
        cp tmp.cpp "${dir}/d.cpp"
    else
        cp tmp.cpp "${dir}/a.cpp"
        cp tmp.cpp "${dir}/b.cpp"
        cp tmp.cpp "${dir}/c.cpp"
        cp tmp.cpp "${dir}/d.cpp"
        cp tmp.cpp "${dir}/e.cpp"
        cp tmp.cpp "${dir}/f.cpp"
    fi

    zsh ./addurl.sh $dir
fi
