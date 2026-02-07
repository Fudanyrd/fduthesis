#!/usr/bin/env sh

# stop on first error.
set -ex

installdir="thesis"
projdir="$PWD"

if test -z "$1" ; then
    installdir="thesis"
else
    installdir="$1"
fi

if test -e "$installdir" ; then
    test -d "$installdir" || (
        echo "Error: $installdir already exists and is not a directory." 1>&2 && exit 1)
else
    mkdir -p "$installdir"
fi
cd "$installdir"

cp -f "$projdir/docs/main.tex"                          .
cp -f "$projdir/docs/main.bib"                          .
cp -f "$projdir/docs/example-image.png"                 .
cp -f "$projdir/source/fduthesis.dtx"                   .
cp -f "$projdir/source/fduthesis-doc.dtx"               .
cp -f "$projdir/source/fduthesis-logo.dtx"              .
cp -f "$projdir/source/fdlogo-1.png"                    .
cp -f "$projdir/source/fdlogo-2.png"                    .
cp -f "$projdir/testfiles/support/fudan-emblem.pdf"     .
cp -f "$projdir/testfiles/support/fudan-emblem-new.pdf" .
cp -f "$projdir/testfiles/support/fudan-name.pdf"       .

xetex "fduthesis.dtx" > /dev/null

rm *.dtx
rm *.ins
rm *.log
rm *.md

rm "fdudoc.cls"
rm "fdulogo-example.tex"
rm "fduthesis-cover.tex"

cd "$projdir"
exit 0
