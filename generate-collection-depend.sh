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
for clt in `cat Collection.list`; do
  sed -i '/^collection/d' $clt.package.depend
done