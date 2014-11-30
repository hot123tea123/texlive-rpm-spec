#/bin/sh
# get collections' revision
for clt in `cat Collection.list`; do
  sed '/^revision /!d' $clt.stanza > $clt.rev
done
for clt in `cat Collection.list`; do
  sed -i 's/revision //' $clt.rev
done