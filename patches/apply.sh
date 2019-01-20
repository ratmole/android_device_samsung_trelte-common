#!/bin/sh

dir=`cd $(dirname $0) && pwd`
top=$dir/../../../..

if [ -n "$(find $dir -name \*.patch -type f)" ]; then
    for patch in `ls $dir/*.patch` ; do
        echo ""
        patch -p1 -N -i $patch -r - -d $top
    done
    echo ""
    find . -name "*.orig" -delete
fi
