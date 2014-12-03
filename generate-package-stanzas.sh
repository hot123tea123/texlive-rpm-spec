#!/bin/sh
#
# generate Package stanzas from texlive.tlpdb.orig
sed -e '/./{H;$!d;}' -e 'x;/category Package/!d;' texlive.tlpdb.orig > Package.stanza
sed -i -e '/./{H;$!d;}' -e 'x;/alpha-linux\|amd64-freebsd\|amd64-kfreebsd\|amd64-netbsd\|armel-linux\|armhf-linux\|i386-cygwin\|i386-freebsd\|i386-kfreebsd\|i386-linux\|i386-netbsd\|i386-solaris\|mipsel-linux\|powerpc-linux\|sparc-solaris\|universal-darwin\|win32\|x86_64-cygwin\|x86_64-darwin\|x86_64-linux\|x86_64-solaris/d;' Package.stanza