#!/bin/sh
#
# check License
rm -vf all-license.txt
for pkg in `cat Package.list`; do
	sed '/^catalogue-license /!d' $pkg.stanza >> all-license.txt
done
sed -i 's/catalogue-license //' all-license.txt
sed -i 's/[0-9]\.[0-9]\|[0-9]*//g' all-license.txt
# 删除所有重复行
sort all-license.txt > all-license.txt.tmp
uniq all-license.txt.tmp > all-license.txt