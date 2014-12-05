#!/bin/sh
#
# generate ConTeXt stanzas from texlive.tlpdb.orig
sed -e '/./{H;$!d;}' -e 'x;/category \<ConTeXt\>/!d;' texlive.tlpdb.orig > ConTeXt.stanza