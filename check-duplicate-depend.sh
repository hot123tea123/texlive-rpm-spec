#!/bin/sh
#
for clt in `cat Collection.list`; do
  sort $clt.package.depend -o $clt.package.depend.sort
done
#
# check if two collections have same depend package
tmp=(`cat Collection.list`)
count=${#tmp[@]}
echo $count
for((i=0;i<$count-1;i++)); do
  for((j=i;j<$count;j++)); do
  comm ${tmp[i]}.package.depend.sort ${tmp[i+1]}.package.depend.sort > ${tmp[i]}.${tmp[i+1]}.same
  done
done
for tmp in `ls *.same`; do
  if test -s $tmp; then
    rm -v $tmp
  fi
done


