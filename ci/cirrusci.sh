#!/usr/bin/env bash

# Installs the OS-specific prerequisites for Cirrus CI jobs.
# This file is invoked by DMD, druntime and Phobos' .cirrus.yml
# and sets up the machine for the later steps with ci/run.sh.

set -uexo pipefail

# OS_NAME: linux|osx|freebsd
if [ -z "${OS_NAME:-}" ] ; then echo "Variable 'OS_NAME' needs to be set."; exit 1; fi
# MODEL: 32|64
if [ -z "${MODEL:-}" ] ; then echo "Variable 'MODEL' needs to be set."; exit 1; fi
# HOST_DMD: dmd[-<version>]|ldc[-<version>]|gdmd-<version>
if [ -n "${HOST_DC:-}" ] ; then HOST_DMD=${HOST_DC}; fi
if [ -z "${HOST_DMD:-}" ] ; then echo "Variable 'HOST_DMD' needs to be set."; exit 1; fi

if [ "$OS_NAME" == "linux" ]; then
  export DEBIAN_FRONTEND=noninteractive
  packages="git-core make g++ gdb gnupg curl libcurl4 tzdata zip unzip xz-utils llvm valgrind libc6-dbg"
  if [ "$MODEL" == "32" ]; then
    dpkg --add-architecture i386
    packages="$packages g++-multilib libcurl4:i386 libc6-dbg:i386"
  fi
  if [ "${HOST_DMD:0:4}" == "gdmd" ]; then
    # ci/run.sh uses `sudo add-apt-repository ...` to add a PPA repo
    packages="$packages sudo software-properties-common"
  fi
  apt-get -q update
  apt-get install -yq $packages
elif [ "$OS_NAME" == "osx" ]; then
  # macOS images provide the required toolchain; nothing to install here
  echo "No OS-specific prerequisites to install for macOS."
elif [ "$OS_NAME" == "freebsd" ]; then
  packages="git gmake devel/llvm12"
  if [ "$HOST_DMD" == "dmd-2.079.0" ] ; then
    packages="$packages lang/gcc9"
  fi
  pkg install -y $packages
  # replace default make by GNU make
  rm -f /usr/bin/make
  ln -sf /usr/local/bin/gmake /usr/bin/make
  ln -sf /usr/local/bin/llvm-dwarfdump12 /usr/bin/llvm-dwarfdump
fi
