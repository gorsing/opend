// REQUIRED_ARGS: -wi
// https://issues.dlang.org/show_bug.cgi?id=4375: Dangling else
/*
TEST_OUTPUT:
---
compilable/fail4375j.d(16): Warning: else is dangling, add { } after condition at compilable/fail4375j.d(11)
---
*/

void main() {
    if (true)
        final switch (1)    // o_O
            case 1:
                if (false)
                    assert(119);
    else
        assert(120);
}

// OpenD: -w/-de are informational aliases for -wi/-dw; compilation succeeds.
// Old DMD semantics: -w made warnings halt compilation, -de made
// deprecations halt compilation. Kept expectation below for reference.
