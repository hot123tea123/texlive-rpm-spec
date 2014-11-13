#!/bin/sh
# Package list
# remove architecture dependency TLCore items, too
echo "generate Package list..."
sed -i -e '/./{H;$!d;}' -e 'x;/i386-linux\|x86_64-linux\|alpha-linux\|amd64-freebsd\|amd64-kfreebsd\|amd64-netbsd\|armel-linux\|armhf-linux\|i386-cygwin\|i386-freebsd\|i386-kfreebsd\|i386-netbsd\|i386-solaris\|mipsel-linux\|powerpc-linux\|sparc-solaris\|universal-darwin\|win32\|x86_64-cygwin\|x86_64-darwin\|x86_64-solaris/d;' Package.stanza
sed '/^name /!d' Package.stanza > Package.list
sed -i 's/name //' Package.list
# end Package list