// REQUIRED_ARGS: -d
inout int x;

struct S3748
{
    inout(int) err8;
}

// OpenD: this check is intentionally not enforced; the test now only verifies successful compilation.
// Old DMD semantics: compilation failed with an error (see git history for the original expected diagnostics).
