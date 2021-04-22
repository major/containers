#!/bin/bash
set -euxo pipefail

dnf -y install "@Fedora Packager" rpmdevtools vim

# Allow kerberos to work from within a container.
sed -i 's/default_ccache_name/d' /etc/krb5.conf

# Set the default realm to make it easier to kinit.
sed 's/^#.*default_realm.*$/    default_realm = FEDORAPROJECT.ORG/' /etc/krb5.conf

dnf clean all
