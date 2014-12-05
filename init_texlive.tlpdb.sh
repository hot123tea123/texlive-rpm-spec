#!/bin/sh
#
./clean-files.sh
# generate stanzas
./generate-tlcore-stanzas.sh
./generate-package-stanzas.sh
./generate-collection-stanzas.sh
./generate-scheme-stanzas.sh
./generate-context-stanzas.sh
# generate item list
./generate-tlcore-list.sh
./generate-package-list.sh
./generate-collection-list.sh
./generate-scheme-list.sh
./generate-context-list.sh
# split stanza
./split-tlcore-stanza.sh
./split-collection-stanza.sh
./split-package-stanza.sh
./split-scheme-stanza.sh
./split-context-stanza.sh
# generate depend
./generate-collection-depend.sh
./generate-scheme-depend.sh
# split reloc & non-reloc
./split-reloc.sh
./split-reloc-package-in-collection.sh
# generate download links
./generate-url.sh
#
# next, use wget or aria2 to download tarballs
# you may run check-duplicate-depend.sh to 
# check duplicate depend between collections
#
# get revision number
./get-collection-revision.sh
./get-context-revision.sh
./get-package-revision.sh
# generate collection's CONTENTS file
./generate-collection-contents.sh
