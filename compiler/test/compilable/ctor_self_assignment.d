/**
REQUIRED_ARGS: -dw
TEST_OUTPUT:
---
compilable/ctor_self_assignment.d(17): Deprecation: cannot initialize field `location` with itself
compilable/ctor_self_assignment.d(15):        did you mean to use parameter `locaction`?
---
*/
// https://forum.dlang.org/post/teghfhpmvkdcfwfeovua@forum.dlang.org

alias Location = int;

struct Node
{
    this(Location locaction, uint f)
    {
        this.location = location;
        this.f = f;
    }

    Location location;
    uint f;
}

// OpenD: -w/-de are informational aliases for -wi/-dw; compilation succeeds.
// Old DMD semantics: -w made warnings halt compilation, -de made
// deprecations halt compilation. Kept expectation below for reference.
