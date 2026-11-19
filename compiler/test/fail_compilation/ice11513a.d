/*
EXTRA_FILES: imports/ice11513x.d
TEST_OUTPUT:
---
fail_compilation/ice11513a.d(15): Error: unable to read module `imports`
fail_compilation/ice11513a.d(15):        Expected 'ice11513a/imports.d' or 'ice11513a/imports/package.d' in one of the following import paths:
import path[0] = fail_compilation
import path[1] = /workspace/compiler/test/../../druntime/import
import path[2] = /workspace/compiler/test/../../phobos
---
*/

module ice11513a;

import ice11513a.imports;
