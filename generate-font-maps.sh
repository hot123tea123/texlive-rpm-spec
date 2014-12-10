#!/bin/sh
#
# clean files
rm -vf *.maps mapsdir
# generate font maps file
for clt in `cat Collection.list`; do
  for pkg in `cat $clt.package.depend`; do
    sed '/^execute addMap\|execute addMixedMaps/!d' $pkg.stanza >> $clt.maps
  done
done
# delete empty files
for tmp in *.maps; do
  if test -s $tmp; then
  echo "Do nothing!" > /dev/null
  else
  rm -vf $tmp
  fi
done
  
#
for tmp in *.maps; do
  sed -i 's/execute add//' $tmp
done
mkdir -p mapsdir
mv *.maps mapsdir