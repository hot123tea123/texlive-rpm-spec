#/bin/sh
# Collection list
echo "generating Collection list..."
sed '/^name /!d' Collection.stanza > Collection.list
sed -i 's/name //' Collection.list
# delete collection-wintools & collection-texworks
sed -i '/^collection-wintools$\|^collection-texworks$/d' Collection.list
# also delete collection-wintools stanza & collection-texworks stanza
sed -i -e '/./{H;$!d;}' -e 'x;/name \<collection-wintools\>\|name \<collection-texworks\>/d;' Collection.stanza
# sort
sort Collection.list -o Collection.list.sort
sort -r Collection.list.sort -o Collection.list
# end Collection list
