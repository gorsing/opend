/*
EXTRA_FILES: imports/ice11513y.d
TEST_OUTPUT:
---
fail_compilation/ice11513b.d(15): Error: unable to read module `ice11513y`
fail_compilation/ice11513b.d(15):        Expected 'ice11513b/imports/ice11513y.d' or 'ice11513b/imports/ice11513y/package.d' in one of the following import paths:
import path[0] = fail_compilation
import path[1] = /workspace/compiler/test/../../druntime/import
import path[2] = /workspace/compiler/test/../../phobos
---
*/

module ice11513b;

import ice11513b.imports.ice11513y;
