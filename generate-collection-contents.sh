#/bin/sh
#
# get collection's contents,
# format
# <package> <revision>
rm -vf *.contents
for clt in `cat Collection.list`; do
  for pkg in `cat $clt.package.depend`; do
    tmp=`cat $pkg.rev`
    echo $pkg > $pkg.contents
    sed -i "s/$/ $tmp/" $pkg.contents
    cat $pkg.contents >> $clt.contents
  done
done