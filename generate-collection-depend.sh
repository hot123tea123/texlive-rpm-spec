#!/bin/sh
# generate every single collection's dependency
# $clt.package.depend contains only package list
for clt in `cat Collection.list`; do
  sed -n '/^depend/p' $clt.stanza > $clt.package.depend
done
for clt in `cat Collection.list`; do
  sed -i 's/depend //' $clt.package.depend
done
# dependency between collections
# $clt.collection.depend contains only collection list
for clt in `cat Collection.list`; do
  sed '/^collection-/!d' $clt.package.depend > $clt.collection.depend
done
# delete empty $clt.collection.depend
for clt in `cat Collection.list`; do
  if test -s $clt.collection.depend; then
    echo "Do noting" > /dev/null
  else
    rm -vf $clt.collection.depend
  fi
done
#
for clt in `cat Collection.list`; do
  sed -i '/^collection/d' $clt.package.depend
done
#
# delete depend from TLCore.list,
# which is binary or some scripts
#
for clt in `cat Collection.list`; do
  sort -r $clt.package.depend -o $clt.package.depend.sort
done
#
for clt in `cat Collection.list`; do
  comm -23 $clt.package.depend.sort TLCore.list.sort > $clt.package.depend
done










