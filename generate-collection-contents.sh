#/bin/sh
#
# get collection's contents,
# format
# <package> <revision>
rm -vf *.contents
for clt in `cat Collection.list`; do
  for dep in `cat $clt.package.depend`; do
    tmp=`cat $dep.rev`
    echo $tmp > $dep.contents
    sed -i "s/\$/\t$dep/" $dep.contents
    echo "generating $dep for $clt..."
    cat $dep.contents >> $clt.contents
  done
done