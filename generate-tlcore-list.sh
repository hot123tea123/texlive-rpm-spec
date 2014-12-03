#!/bin/sh
#
# TLCore list
echo "generate TLCore list..."
sed '/^name /!d' TLCore.stanza > TLCore.list
sed -i 's/name //' TLCore.list
sed -i '/alpha-linux$\|amd64-freebsd$\|amd64-kfreebsd$\|amd64-netbsd$\|armel-linux$\|armhf-linux$\|i386-cygwin$\|i386-freebsd$\|i386-kfreebsd$\|i386-linux$\|i386-netbsd$\|i386-solaris$\|mipsel-linux$\|powerpc-linux$\|sparc-solaris$\|universal-darwin$\|win32$\|x86_64-cygwin$\|x86_64-darwin$\|x86_64-linux$\|x86_64-solaris$/d' TLCore.list
# end TLCore list