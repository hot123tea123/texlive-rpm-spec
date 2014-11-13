#!/bin/sh
#
# split package with or without RELOC from collection.package.depend
for $clt in `cat Collection.list`; do
  for $tmp in `cat $clt.package.depend`; do
    sed "/$tmp/!d" package-with-RELOC.list > $clt.package-with-RELOC.package.depend
    sed "/$tmp/!d" package-without-RELOC.list > $clt.package-without-RELOC.package.depend
  done
done