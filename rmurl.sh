#!/bin/zsh

KEY='Link to the Problem'

for file in `\find . -maxdepth 2 -type f -name "*.cpp"` ; do
    base="$(basename $file)"
    dir="${$(dirname $file):2}"

    if grep -q $KEY $file ; then
        editted='true'
    else
        editted='false'
    fi

    if [ $editted = 'true' ] ; then
        gsed -i '3d' $file
        gsed -i '2d' $file
        gsed -i '1d' $file
    fi
done
