#!/bin/sh
#
# generate Collection stanzas from texlive.tlpdb.orig
sed -e '/./{H;$!d;}' -e 'x;/category \<Collection\>/!d;' texlive.tlpdb.orig > Collection.stanza