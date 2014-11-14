#!/bin/sh
#

#
# package with doc files
sed -e '/./{H;$!d;}' -e 'x;/docfiles/!d;' Package.stanza > Package.doc.stanza
sed '/^name /!d' Package.doc.stanza > Package.doc.list
sed -i 's/name //' Package.doc.list
# package with source files
sed -e '/./{H;$!d;}' -e 'x;/srcfiles/!d;' Package.stanza > Package.src.stanza
sed '/^name /!d' Package.src.stanza > Package.src.list
sed -i 's/name //' Package.src.list
#
#
# generate url for download
#
# package.tar.xz
sed 's/^/http:\/\/mirrors.ustc.edu.cn\/CTAN\/systems\/texlive\/tlnet\/archive\//' Package.list > package.url
sed -i 's/$/\.tar\.xz/' package.url
#
# package.doc.tar.xz
sed 's/^/ftp:\/\/tug.org\/texlive\/tlnet\/archive\//' Package.doc.list > package.doc.url
sed -i 's/$/\.doc\.tar\.xz/' package.doc.url
#
# package.source.tar.xz
sed 's/^/http:\/\/mirrors.ustc.edu.cn\/CTAN\/systems\/texlive\/tlnet\/archive\//' Package.src.list > package.src.url
sed -i 's/$/\.source\.tar\.xz/' package.src.url