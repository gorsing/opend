// REQUIRED_ARGS: -wi
// https://issues.dlang.org/show_bug.cgi?id=4375: Dangling else
/*
TEST_OUTPUT:
---
compilable/fail4375b.d(16): Warning: else is dangling, add { } after condition at compilable/fail4375b.d(12)
---
*/

void main() {
    // disallowed
	if (true)
		foreach (i; 0 .. 5)
			if (true)
				assert(5);
    else
        assert(6);
}

// OpenD: -w/-de are informational aliases for -wi/-dw; compilation succeeds.
// Old DMD semantics: -w made warnings halt compilation, -de made
// deprecations halt compilation. Kept expectation below for reference.
