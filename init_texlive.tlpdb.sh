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





















