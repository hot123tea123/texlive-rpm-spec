#/bin/sh
# get ConTeXt' revision
for tmp in `cat ConTeXt.list`; do
  echo "processing $tmp revision..."
  sed '/^revision /!d' $tmp.stanza > $tmp.rev
done
for tmp in `cat ConTeXt.list`; do
  echo "generating $tmp's revision..."
  sed -i 's/revision //' $tmp.rev
done