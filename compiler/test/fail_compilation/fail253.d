/*
TEST_OUTPUT:
---
fail_compilation/fail253.d(14): Error: cannot modify `inout` expression `x`
---
*/
void main()
{
    foreach (i; 0 .. 2)
    {
        foreach (inout char x; "hola")
        {
            //printf("%c", x);
            x = '?';
        }
    }
    inout(int)* err11;
}
