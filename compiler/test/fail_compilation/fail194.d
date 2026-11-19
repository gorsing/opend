/*
TEST_OUTPUT:
---
fail_compilation/fail194.d(11): Deprecation: `void` initializers for pointers not allowed in non-`@system`/`@trusted` code
fail_compilation/fail194.d(19): Error: function `& foo` is overloaded
---
*/

import core.vararg;

void bar(int i, ...) { }

void foo() { }
void foo(int) { }

void main()
{
    //bar(1, cast(void function())&foo);
    bar(1, &foo);
}
