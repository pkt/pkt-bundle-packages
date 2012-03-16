"Bundle" Metapackages
=====================

Bundles are collections of utilities that are typically installed
together in order to complete a task and sometimes you want to
uninstall them soon after finishing said task, to maintain a
clean system.

Bundles are implemented as debian *metapackages*, i.e., packages
that only have dependencies, no installed files.

In former (internal) incarnations of this project, I was using
a patched version of debian's *equivs* to generate the metapackages.
This version uses *dh-make* instead of *equivs*, avoiding the
need for patches and allowing for nicer looking source packages.

Usage
-----

For adding a new bundle I just run

>
> $ ./new pkt-bundle-<name>
>

which (after confirming and editing control and changelog file
as appropriate) produces a pkt-bundle-$name metapackage.

Building all bundles is just a:

> $ make

and publishing to my ppa (pktoss/testing) is done by

> $ make publish

Updating a metapackage is done in the typical debian way, i.e.,
edit debian/control file of the package and run

> $ dch -i

to update the changelog.

This project was made to "scratch an itch", so it doesn't have
many bells and whistles, but feel free to fork and adapt to your
taste/needs :)

