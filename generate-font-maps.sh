#!/bin/sh
#
# clean files
rm -vf *.maps
# generate font maps file
for clt in `cat Collection.list`; do
  for pkg in `cat $clt.package.depend`; do
    sed '/^execute addMap\|execute addMixedMaps/!d' $pkg.stanza>> $clt.maps
  done
done
#
for tmp in *.maps; do
  sed -i 's/execute add//' $tmp
done