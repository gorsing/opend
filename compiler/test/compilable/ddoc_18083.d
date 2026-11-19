// REQUIRED_ARGS: -D -Dd${RESULTS_DIR}/fail_compilation -o- -wi -c
/* TEST_OUTPUT:
---
compilable/ddoc_18083.d(12): Warning: Ddoc: function declaration has no parameter 'this'
compilable/ddoc_18083.d(12): Warning: Ddoc: parameter count mismatch, expected 0, got 1
---
*/
/**
Params:
  this = non-existent parameter
*/
int foo()
{
    return 1;
}

// OpenD: -w/-de are informational aliases for -wi/-dw; compilation succeeds.
// Old DMD semantics: -w made warnings halt compilation, -de made
// deprecations halt compilation. Kept expectation below for reference.
