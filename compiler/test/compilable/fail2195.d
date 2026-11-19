// https://issues.dlang.org/show_bug.cgi?id=2195
// REQUIRED_ARGS: -dw
/*
TEST_OUTPUT:
---
compilable/fail2195.d(17): Deprecation: variable `variable` is shadowing variable `fail2195.main.variable`
compilable/fail2195.d(14):        declared here
---
*/

void main()
{
    int[int] arr;
    int variable;
    foreach (i, j; arr)
    {
        int variable;  // shadowing is disallowed but not detected
    }
}

void fun()
{
    int var1, var2, var3;

    void gun()
    {
        int var1; // OK?

        int[] arr;
        foreach (i, var2; arr) {} // OK?

        int[int] aa;
        foreach (k, var3; aa) {} // Not OK??
    }
}

// OpenD: -w/-de are informational aliases for -wi/-dw; compilation succeeds.
// Old DMD semantics: -w made warnings halt compilation, -de made
// deprecations halt compilation. Kept expectation below for reference.
