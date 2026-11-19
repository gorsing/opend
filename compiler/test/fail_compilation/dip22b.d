/*
EXTRA_FILES: imports/dip22b.d imports/dip22c.d
TEST_OUTPUT:
---
fail_compilation/imports/dip22b.d(3): Error: unable to read module `dip22c`
fail_compilation/imports/dip22b.d(3):        Expected 'pkg/dip22c.d' or 'pkg/dip22c/package.d' in one of the following import paths:
import path[0] = fail_compilation
import path[1] = /workspace/compiler/test/../../druntime/import
import path[2] = /workspace/compiler/test/../../phobos
---
*/
module pkg.dip22;

import imports.dip22b;

Foo foo;
