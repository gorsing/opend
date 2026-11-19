/*
COMPILED_IMPORTS: imports/incompletemodname.d
REQUIRED_ARGS: -Ifail_compilation
PERMUTE_ARGS:
TEST_OUTPUT:
---
fail_compilation/badimport3.d(10): Error: from file wrongpkgname.d must be imported with 'import wrongpkg.wrongpkgname;'
---
*/
import imports.wrongpkgname;
