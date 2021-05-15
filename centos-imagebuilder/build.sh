#!/bin/bash
set -euxo pipefail

# Speed up dnf.
echo "fastestmirror=1" >> /etc/dnf/dnf.conf

# Fake out an SELinux configuration so osbuild-selinux won't complain.
mkdir -vp /etc/selinux
touch /etc/selinux/config

# Install required packages and clean up.
dnf -qy upgrade
dnf -qy install composer-cli osbuild-composer
dnf clean all

# Start composer at boot.
systemctl enable osbuild-composer.socket