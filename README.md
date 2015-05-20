Build Apache 2.2 packages with strong DH moduli
===============================================

This script builds Ubuntu packages for Apache 2.2, patched to use 2048-bit
and 3072-bit moduli defined in
[RFC 3526](https://www.ietf.org/rfc/rfc3526.txt). This mitigates the Logjam
vulnerability in Ubuntu 12.04 LTS, until Apache 2.4.7 or greater is backported
or the Ubuntu maintainers incorporate a similar patch.

Typical use:

    ./buildpkg.sh
    PACKAGES=`dpkg -l | grep \ apache2 | awk '{ print $2 }' | sed -e 's/$/_2.2.22-1ubuntu1.9_amd64.deb/'`
    sudo dpkg -i $PACKAGES

Note that the script does call `sudo apt-get build-dep`, but otherwise
operates without privileges.
