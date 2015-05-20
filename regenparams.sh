#!/bin/bash
#
# Generate patch using unique DH parameters
#
# 2015 Chris Markiewicz

if [ -e b/ ]; then rm -rf b; fi

cp -r a b
patch -p0 < ssl_engine_dh_c.patch
pushd b/modules/ssl
    perl ssl_engine_dh.c
popd
diff -u {a,b}/modules/ssl/ssl_engine_dh.c > rfc3526.patch

rm -rf b
