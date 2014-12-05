#!/bin/sh
#
# TLCore list
echo "generating TLCore list..."
sed '/^name /!d' TLCore.stanza > TLCore.list
sed -i 's/name //' TLCore.list
sort TLCore.list -o TLCore.list.sort
sort -r TLCore.list.sort -o TLCore.list
# end TLCore list
