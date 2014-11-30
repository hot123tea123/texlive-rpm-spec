#!/bin/sh
# #
rm -rf texlivedir
# copy source tarball to texlivedir
for clt in `cat Collection.list`; do
  mkdir -p texlivedir/$clt/texmf-dist
  if test -s $clt.package-with-RELOC.package.depend; then
    for tmp in `cat $clt.package-with-RELOC.package.depend`; do
      cp -v texlive-archive/$tmp.* texlivedir/$clt/texmf-dist
    done
  fi
  if test -s $clt.package-without-RELOC.package.depend; then
    for tmp in `cat $clt.package-without-RELOC.package.depend`; do
      cp -v texlive-archive/$tmp.* texlivedir/$clt/
    done
  fi
done
#
# get collections' revision
for clt in `cat Collection.list`; do
  sed '/^revision /!d' $clt.stanza > $clt.rel
done
for clt in `cat Collection.list`; do
  sed -i 's/revision //' $clt.rel
done
#
# change collections dir name, texlive-<collection name>-<year>.<revision>
# and generate tarball
sed 's/collection-//' Collection.list > texlive-collection.list
year=2014
for clt in `cat texlive-collection.list`; do
  rel=`cat collection-$clt.rel`
  mv -v texlivedir/collection-$clt texlivedir/texlive-$clt-$year.$rel
done
# generate tarball
pushd texlivedir
ls > list
for tarball in `cat list`; do
  tar cvfJ $tarball.tar.xz $tarball
done
popd











