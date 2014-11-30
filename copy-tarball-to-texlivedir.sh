#!/bin/sh
# copy source tarball to destdir and generate big tarball
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
./get-collection-revision.sh
#
# change collections dir name, texlive-[collection name]-[year].[revision]
# and generate tarball
# eg. collection-basic -> texlive-collection-basic-2014.33040 -> texlive-collection-basic-2014.33040.tar.xz
year=2014
for clt in `cat Collection.list`; do
  rev=`cat $clt.rev`
  mv -v texlivedir/$clt texlivedir/texlive-$clt-$year.$rev
done
# generate tarball
pushd texlivedir
ls > tarball.list
for tarball in `cat tarball.list`; do
  tar cvfJ $tarball.tar.xz $tarball
done
popd











