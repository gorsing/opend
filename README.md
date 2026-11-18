# OpenD

This is the OpenD Programming Language compiler, originally based on Walter Bright's D Programming Language.

This repository contains a Digital Mars-based compiler, an LLVM-based compiler, the unified runtime, portions of the standard library, bundled libraries, and the `opend` CLI tool.

## Quick start

Prebuilt binaries are available on the releases page:

https://github.com/opendlang/opend/releases/tag/CI

The latest build is always found there.

## Repository layout

- [`compiler/`](compiler/src/README.md) — Digital Mars-based D compiler (`dmd`), build script (`compiler/src/build.d`), and [compiler test suite](compiler/test/README.md).
- [`ldc/`](ldc/README.md) — LLVM-based D compiler (`ldc2` / `ldmd2`), maintained as a git subtree from upstream.
- [`druntime/`](druntime/README.md) — Unified D runtime library (`object`, `core.*`, `rt.*`).
- [`phobos/`](phobos/README.md) — Standard library (`std.*`, `etc.*`), maintained as a git subtree from upstream.
- [`libraries/`](libraries/README.md) — Additional bundled libraries managed via git subtree merges and `libraries/extractor.d`.
- `opend/` — `opend` CLI driver (`opend/opend.d`) for building, running, testing, and fetching packages.
- [`ci/`](ci/README.md) — Continuous integration scripts and documentation.

## Building from source

Building requires GNU Make, a C++ toolchain, CMake (for `ldc`), and a host D compiler (`dmd`, `ldmd2`, or `gdmd`, configurable via `HOST_DMD`).

```sh
# Build all default targets (dmd, druntime, phobos, ldc)
make -j$(nproc)

# Build individual components
make -j$(nproc) dmd
make -j$(nproc) druntime
make -j$(nproc) phobos
make -j$(nproc) ldc

# Run compiler and druntime test suites
make -j$(nproc) test
```

## Hacking

See:
https://docs.github.com/en/get-started/using-git/about-git-subtree-merges

`ldc`, `phobos`, and upstream packages under [`libraries/`](libraries/README.md) are maintained as git subtrees from upstream. See [`CONTRIBUTING.md`](CONTRIBUTING.md) and [`ci/README.md`](ci/README.md) for contribution and CI details.

