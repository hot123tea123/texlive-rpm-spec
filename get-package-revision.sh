#/bin/sh
# get packages' revision
for pkg in `cat Package.list`; do
  echo "processing $pkg revision..."
  sed '/^revision /!d' $pkg.stanza > $pkg.rev
done
for pkg in `cat Package.list`; do
  echo "generating $pkg's revision..."
  sed -i 's/revision //' $pkg.rev
done