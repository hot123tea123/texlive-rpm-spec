#!/bin/sh
#
# clean files generated last time run this script
rm -rvf *.stanza *.list *.depend
#
#  split TLCore, Package, Collection, Scheme stanza from texlive.tlpdb.orig
sed -e '/./{H;$!d;}' -e 'x;/category TLCore/!d;' texlive.tlpdb.orig > TLCore.stanza
sed -e '/./{H;$!d;}' -e 'x;/category Package/!d;' texlive.tlpdb.orig > Package.stanza
sed -e '/./{H;$!d;}' -e 'x;/category Collection/!d;' texlive.tlpdb.orig > Collection.stanza
sed -e '/./{H;$!d;}' -e 'x;/category Scheme/!d;' texlive.tlpdb.orig > Scheme.stanza
#
#
# get items' name list
#
# TLCore list
# remove: 00texlive.config, 00texlive.image, 00texlive.installation, 00texlive.installer
# these items are installation configuration, should not be packaged in a RPM.
sed -i -e '/./{H;$!d;}' -e 'x;/name 00texlive.config\|name 00texlive.image\|name 00texlive.installation\|name 00texlive.installer/d;' TLCore.stanza
# remove architecture dependency TLCore items
sed -i -e '/./{H;$!d;}' -e 'x;/i386-linux\|x86_64-linux\|alpha-linux\|amd64-freebsd\|amd64-kfreebsd\|amd64-netbsd\|armel-linux\|armhf-linux\|i386-cygwin\|i386-freebsd\|i386-kfreebsd\|i386-netbsd\|i386-solaris\|mipsel-linux\|powerpc-linux\|sparc-solaris\|universal-darwin\|win32\|x86_64-cygwin\|x86_64-darwin\|x86_64-solaris/d;' TLCore.stanza
sed '/^name /!d' TLCore.stanza > TLCore.list
sed -i 's/name //' TLCore.list
# end TLCore list
#
# Package list
# remove architecture dependency TLCore items, too
sed -i -e '/./{H;$!d;}' -e 'x;/i386-linux\|x86_64-linux\|alpha-linux\|amd64-freebsd\|amd64-kfreebsd\|amd64-netbsd\|armel-linux\|armhf-linux\|i386-cygwin\|i386-freebsd\|i386-kfreebsd\|i386-netbsd\|i386-solaris\|mipsel-linux\|powerpc-linux\|sparc-solaris\|universal-darwin\|win32\|x86_64-cygwin\|x86_64-darwin\|x86_64-solaris/d;' Package.stanza
sed '/^name /!d' Package.stanza > Package.list
sed -i 's/name //' Package.list
# end Package list
#
# Collection list
sed '/^name /!d' Collection.stanza > Collection.list
sed -i 's/name //' Collection.list
# end Collection list
#
# Scheme list
sed '/^name /!d'  Scheme.stanza > Scheme.list
sed -i 's/name //' Scheme.list
#end Scheme list
#
#
# split collections' stanza from Collection.stanza
for clt in `cat Collection.list`; do
	sed -e '/./{H;$!d;}' -e "x;/name $clt/!d;" Collection.stanza > $clt.stanza
done
# generate Collections' dependency
# all items list in $clt.depend is dependency item name
for clt in `cat Collection.list`; do
	sed -n '/^depend/p' $clt.stanza > $clt.depend
done
for clt in `cat Collection.list`; do
	sed -i 's/depend //' $clt.depend
done
# dependency between collections
for clt in `cat Collection.list`; do
	sed '/^collection-/!d' $clt.depend > $clt.collection.depend
done
# delete empty .collection.depend file, which means no dependency
for clt in `cat Collection.list`; do
	if test -s $clt.collection.depend; then
	echo "Do nothing" > /dev/null
	else
		rm -vf $clt.collection.depend
	fi
done
#
#
# split packages' stanza from Package.stanza
for pkg in `cat Package.list`; do
	sed -e '/./{H;$!d;}' -e "x;/name $pkg/!d;" Package.stanza > $pkg.stanza
done






























