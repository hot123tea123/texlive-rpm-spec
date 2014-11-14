#!/bin/sh
#
sed -e '/./{H;$!d;}' -e 'x;/RELOC/!d;' Package.stanza > package-with-RELOC.stanza
sed -e '/./{H;$!d;}' -e 'x;/RELOC/d;' Package.stanza > package-without-RELOC.stanza

sed '/^name /!d' package-with-RELOC.stanza > package-with-RELOC.list
sed -i 's/name //' package-with-RELOC.list
sed '/^name /!d' package-without-RELOC.stanza > package-without-RELOC.list
sed -i 's/name //' package-without-RELOC.list