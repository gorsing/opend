/* REQUIRED_ARGS: -dw
TEST_OUTPUT:
---
compilable/cdeprecated.i(18): Deprecation: function `cdeprecated.mars` is deprecated
compilable/cdeprecated.i(19): Deprecation: function `cdeprecated.jupiter` is deprecated - jumping jupiter
compilable/cdeprecated.i(20): Deprecation: function `cdeprecated.saturn` is deprecated
compilable/cdeprecated.i(21): Deprecation: function `cdeprecated.neptune` is deprecated - spinning neptune
---
*/
__declspec(deprecated) int mars();
__declspec(deprecated("jumping jupiter")) int jupiter();
__attribute__((deprecated)) extern int saturn();
__attribute__((deprecated("spinning neptune"))) extern int neptune();

int test()
{
    return
        mars() +
        jupiter() +
        saturn() +
        neptune();
}

// OpenD: -w/-de are informational aliases for -wi/-dw; compilation succeeds.
// Old DMD semantics: -w made warnings halt compilation, -de made
// deprecations halt compilation. Kept expectation below for reference.
