/*
EXTRA_FILES: imports/test64a.d
TEST_OUTPUT:
---
fail_compilation/test64.d(16): Error: unable to read module `imports`
fail_compilation/test64.d(16):        Expected 'imports.d' or 'imports/package.d' in one of the following import paths:
import path[0] = fail_compilation
import path[1] = /workspace/compiler/test/../../druntime/import
import path[2] = /workspace/compiler/test/../../phobos
---
*/


//import std.stdio;

import imports;

int main(string[] args)
{
    //writefln(file1);
    return 0;
}
