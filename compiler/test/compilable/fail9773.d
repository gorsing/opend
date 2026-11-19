// REQUIRED_ARGS: -d
void f(ref string a = "")
{
    a = "crash and burn";
}

// OpenD: this check is intentionally not enforced; the test now only verifies successful compilation.
// Old DMD semantics: compilation failed with an error (see git history for the original expected diagnostics).
