#!/bin/sh
#
# generate Package stanzas from texlive.tlpdb.orig
sed -e '/./{H;$!d;}' -e 'x;/category Package/!d;' texlive.tlpdb.orig > Package.stanza