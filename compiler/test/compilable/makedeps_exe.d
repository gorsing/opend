/**
REQUIRED_ARGS: -makedeps -Jcompilable/extra-files
EXTRA_SOURCES: imports/makedeps_a.d
LINK:
TRANSFORM_OUTPUT: remove_lines(druntime)
TEST_OUTPUT:
---
{{RESULTS_DIR}}/compilable/makedeps_exe_0.o: \
  compilable/makedeps_exe.d \
  compilable/imports/makedeps_a.d \
  compilable/extra-files/makedeps-import.txt \
  compilable/extra-files/makedeps-import-codemixin.txt \
---
**/
module makedeps_exe;

// Test import statement
import imports.makedeps_a;

// Test import expression
enum text = import("makedeps-import.txt");
static assert(text == "Imported text\x0a");

/*******************************/
// https://issues.dlang.org/show_bug.cgi?id=21844
enum bool failingModuleImport = __traits(compiles, ((){ import does.not.exist; })());
enum bool failingFileImport = __traits(compiles, ((){ return import("does.not.exists.txt");})());
enum bool workingFileImport = __traits(compiles, ((){ return import("makedeps-import-codemixin.txt");})());
static assert (workingFileImport);

void main()
{
    a_func();
}
