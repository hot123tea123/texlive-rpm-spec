#!/bin/sh
#
# generate every single scheme's depend
for tmp in `cat Scheme.list`; do
  sed -n '/^depend/p' $tmp.stanza > $tmp.depend
done
for tmp in `cat Scheme.list`; do
  sed -i 's/depend //' $tmp.depend
done