#!/bin/sh
# Package list
echo "generating Package list..."
sed '/^name /!d' Package.stanza > Package.list
sed -i 's/name //' Package.list
sort Package.list -o Package.list.sort
sort -r Package.list.sort -o Package.list
# end Package list
