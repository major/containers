# fedora-packager

Build Fedora packages faster with all of the packaging-related tools at your
fingertips! This container comes with all of the stuff you'd expect for a good
Fedora packaging experience, such as:

* `fedpkg`
* `git`
* `rpmbuild`
* `rpmdev-*`

Refer to the [Fedora Packaging Guidelines] for more details.

[Fedora Packaging Guidelines]: https://docs.fedoraproject.org/en-US/packaging-guidelines/

## Usage

Change into a directory where you manage a package and mount that directory
right into the container:

```console
podman run --rm -it -v ${PWD}:/package quay.io/major/fedora-packager:latest
[fedora-packager]# fedpkg help
```
