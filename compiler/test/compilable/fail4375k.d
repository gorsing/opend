// REQUIRED_ARGS: -wi
// https://issues.dlang.org/show_bug.cgi?id=4375: Dangling else
/*
TEST_OUTPUT:
---
compilable/fail4375k.d-mixin-11(15): Warning: else is dangling, add { } after condition at compilable/fail4375k.d-mixin-11(12)
---
*/

void main() {
    mixin(q{
        if(true)
            if(true)
                assert(54);
        else
            assert(55);
    });
}

// OpenD: -w/-de are informational aliases for -wi/-dw; compilation succeeds.
// Old DMD semantics: -w made warnings halt compilation, -de made
// deprecations halt compilation. Kept expectation below for reference.
