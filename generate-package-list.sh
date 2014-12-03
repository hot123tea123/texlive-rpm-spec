#!/bin/sh
# Package list
# remove architecture dependency TLCore items, too
echo "generate Package list..."
sed '/^name /!d' Package.stanza > Package.list
sed -i 's/name //' Package.list
sort Package.list > Package.list.sort
sort -r Package.list.sort > Package.list
# end Package list