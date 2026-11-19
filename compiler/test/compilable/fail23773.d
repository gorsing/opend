// REQUIRED_ARGS: -d
// https://issues.dlang.org/show_bug.cgi?id=23773

void main()
{
    int i;
    int[] arr;
    assert(arr.length = i);
}

// OpenD: this check is intentionally not enforced; the test now only verifies successful compilation.
// Old DMD semantics: compilation failed with an error (see git history for the original expected diagnostics).
