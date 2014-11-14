#!/bin/sh
#
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