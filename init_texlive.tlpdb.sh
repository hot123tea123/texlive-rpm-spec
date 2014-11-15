#!/bin/sh
#
./clean-files.sh

./generate-tlcore-stanzas.sh
./generate-package-stanzas.sh
./generate-collection-stanzas.sh
./generate-scheme-stanzas.sh

./generate-tlcore-list.sh
./generate-package-list.sh
./generate-collection-list.sh
./generate-scheme-list.sh

./split-collection-stanza.sh
./split-package-stanza.sh
./split-scheme-stanza.sh

./generate-collection-depend.sh
./generate-scheme-depend.sh

./split-reloc.sh
./split-reloc-package-in-collection.sh

./generate-url.sh

#
# next, use wget or aria2 to download tarballs
# run check-duplicate-depend.sh to check duplicate depend between collections
















