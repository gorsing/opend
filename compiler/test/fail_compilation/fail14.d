// DISABLED: linux64 - incompatible with intentional OpenD semantics (compiler/runtime behavior differs from upstream DMD)
/*
TEST_OUTPUT:
---
fail_compilation/fail14.d(10): Error: template instance `fail14.A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!(A!int))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))` recursive expansion exceeded allowed nesting limit
---
*/

class A(T)
{
    .A!(A) x;

}

void main()
{
	A!(int);
}
