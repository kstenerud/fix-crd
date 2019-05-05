Chrome Remote Desktop Fixer for Ubuntu
======================================

Fixes Chrome Remote Desktop, which is broken when installed on Ubuntu systems.

This fix assumes Ubuntu 18.04 or 18.10, and has not been tested on anything else.

The fix installs a systemd service that patches chrome-remote-desktop any time it changes (from an apt update).



Installation
------------

There are two installers: One for a real desktop, and one for a virtual desktop.

Normal desktop:

    install-fix-crd.sh

Virdual desktop:

    install-fix-crd-virtual.sh



License
-------

Copyright 2019 Karl Stenerud

Released under MIT license.
