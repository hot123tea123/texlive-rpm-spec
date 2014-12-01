#!/bin/sh
#
# generate TLCore stanzas from texlive.tlpdb.orig
sed -e '/./{H;$!d;}' -e 'x;/category TLCore\>/!d;' texlive.tlpdb.orig > TLCore.stanza