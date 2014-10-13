#!/bin/sh
#
# 删除所有包含 binfiles 的 stanza，那些都打包在 texlive-bin 里了
sed -e '/./{H;$!d;}' -e 'x;/binfiles/d;' texlive.tlpdb.orig > texlive.tlpdb
#
# 删除 00texlive.*
sed -i -e '/./{H;$!d;}' -e 'x;/name 00texlive/d;' texlive.tlpdb
