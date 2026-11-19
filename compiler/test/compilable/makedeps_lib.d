/**
DISABLED: win
REQUIRED_ARGS: -makedeps -Jcompilable/extra-files -lib
LINK:
TRANSFORM_OUTPUT: remove_lines(druntime)
TEST_OUTPUT:
---
{{RESULTS_DIR}}/compilable/makedeps_lib.o: \
  compilable/makedeps_lib.d \
  compilable/imports/makedeps_a.d \
  compilable/extra-files/makedeps-import.txt \
---
**/
// Disabling on windows because default naming of -lib seems broken (names to .exe)
module makedeps_lib;

// Test import statement
import imports.makedeps_a;

// Test import expression
enum text = import("makedeps-import.txt");
static assert(text == "Imported text\x0a");

void func()
{
    a_func();
}
