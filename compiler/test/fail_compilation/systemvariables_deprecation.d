/*
REQUIRED_ARGS: -de
TEST_OUTPUT:
---
fail_compilation/systemvariables_deprecation.d(17): Error: `@safe` function `D main` cannot call `@system` function `systemvariables_deprecation.middle`
fail_compilation/systemvariables_deprecation.d(25):        which calls `systemvariables_deprecation.inferred`
fail_compilation/systemvariables_deprecation.d(28):        which wasn't inferred `@safe` because of:
fail_compilation/systemvariables_deprecation.d(28):        cannot access `@system` variable `x0` in `@safe` code
fail_compilation/systemvariables_deprecation.d(20):        `systemvariables_deprecation.middle` is declared here
---
*/

// test deprecation messages before -preview=systemVariables becomes default

void main() @safe
{
    middle(); // nested deprecation
}

auto middle()
{
    return inferred(); // no deprecation, inferredC is not explicit `@safe`
}

auto inferred()
{
    @system int* x0;
    x0 = null;
}
