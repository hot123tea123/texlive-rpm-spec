#!/bin/sh
#
# generate spec from template
#
# test with packge breakurl
pkg=breakurl
sed "2s/\$/$pkg/" header.name.template > header.name.$pkg
cat header.name.$pkg > $pkg.spec
cat Copyright.template >> $pkg.spec
sed "s/\$/$pkg/" Name.template > Name.$pkg
cat Name.$pkg >> $pkg.spec
sed "1s/\$/$pkg/" VersionandRelease.template > VersionandRelease.$pkg
cat VersionandRelease.$pkg >> $pkg.spec
sed '/^shortdesc/!d' ../$pkg.stanza > $pkg.Summary
sed -i 's/shortdesc/Summary:\t/' $pkg.Summary
cat $pkg.Summary >> $pkg.spec
sed '/^catalogue-license /!d' ../$pkg.stanza > $pkg.License
sed -i 's/catalogue-license //' $pkg.License
# convert license string to capital letters
sed -i '1s/.*/\U&/' $pkg.License
sed -i 's/^/License:\t/' $pkg.License
sed -i 's/License:\tLPPL/License:\tLPPL-1.3c/' $pkg.License
cat $pkg.License >> $pkg.spec
