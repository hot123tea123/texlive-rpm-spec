#!/bin/sh
#
# TLCore list
# remove: 00texlive.config, 00texlive.image, 00texlive.installation, 00texlive.installer
# these items are installation configuration, should not be packaged in a RPM.
echo "generate TLCore list..."
sed -i -e '/./{H;$!d;}' -e 'x;/name 00texlive.config\|name 00texlive.image\|name 00texlive.installation\|name 00texlive.installer/d;' TLCore.stanza
# remove architecture dependency TLCore items
sed -i -e '/./{H;$!d;}' -e 'x;/i386-linux\|x86_64-linux\|alpha-linux\|amd64-freebsd\|amd64-kfreebsd\|amd64-netbsd\|armel-linux\|armhf-linux\|i386-cygwin\|i386-freebsd\|i386-kfreebsd\|i386-netbsd\|i386-solaris\|mipsel-linux\|powerpc-linux\|sparc-solaris\|universal-darwin\|win32\|x86_64-cygwin\|x86_64-darwin\|x86_64-solaris/d;' TLCore.stanza
sed '/^name /!d' TLCore.stanza > TLCore.list
sed -i 's/name //' TLCore.list
# end TLCore list