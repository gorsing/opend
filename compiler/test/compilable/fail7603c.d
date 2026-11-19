// REQUIRED_ARGS: -d
enum x = 3;
void test(ref int val = x) { }

// OpenD: this check is intentionally not enforced; the test now only verifies successful compilation.
// Old DMD semantics: compilation failed with an error (see git history for the original expected diagnostics).
