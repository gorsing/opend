/*
PERMUTE_ARGS:
REQUIRED_ARGS: -deps -Icompilable/extra-files
COMPILED_IMPORTS: extra-files/rdeps7016a.d extra-files/rdeps7016b.d

TRANSFORM_OUTPUT: remove_lines("druntime")
TEST_OUTPUT:
---
depsImport rdeps7016 (compilable/rdeps7016.d) : private : rdeps7016a (compilable/extra-files/rdeps7016a.d)
depsVersion rdeps7016 (compilable/rdeps7016.d) : OD_TestRunner
depsImport rdeps7016a (compilable/extra-files/rdeps7016a.d) : private : rdeps7016b (compilable/extra-files/rdeps7016b.d)
depsImport rdeps7016b (compilable/extra-files/rdeps7016b.d) : private : rdeps7016 (compilable/rdeps7016.d)
---
*/

module rdeps7016;
import rdeps7016a;

void main()
{
    f();
}
