// https://issues.dlang.org/show_bug.cgi?id=23822

// REQUIRED_ARGS: -dw

/*
TEST_OUTPUT:
---
compilable/fail23822.d(21): Deprecation: alias `fail23822.S.value` is deprecated
---
*/

alias Alias(alias A) = A;

struct S
{
    deprecated alias value = Alias!5;
}

void main()
{
    auto a = S.value;
}

// OpenD: -w/-de are informational aliases for -wi/-dw; compilation succeeds.
// Old DMD semantics: -w made warnings halt compilation, -de made
// deprecations halt compilation. Kept expectation below for reference.
