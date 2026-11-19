// REQUIRED_ARGS: -d
void test(ref bool val = true) { }

// OpenD: this check is intentionally not enforced; the test now only verifies successful compilation.
// Old DMD semantics: compilation failed with an error (see git history for the original expected diagnostics).
