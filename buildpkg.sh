#!/bin/bash
#
# 2015 Chris Markiewicz

export QUILT_PATCHES=debian/patches
export QUILT_REFRESH_ARGS="-p ab --no-timestamps --no-index"

if [ -e build ]; then rm -r build; fi

mkdir build
pushd build
    sudo apt-get build-dep -y apache2
    apt-get source apache2
    pushd apache2-2.2.22
        quilt import ../../rfc3526.patch
        cat ../../changelog debian/changelog > debian/changelog.new
        mv debian/changelog.new debian/changelog
        pushd
            dpkg-source -b apache2-2.2.22
        pushd
        dpkg-buildpackage -uc -us
    popd
    cp apache2*.deb ..
popd

rm -r build
