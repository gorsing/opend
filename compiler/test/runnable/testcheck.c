// DISABLED: linux64 - incompatible with intentional OpenD semantics (compiler/runtime behavior differs from upstream DMD)

int main()
{
    int i = 3;
    __check(i == 3);
    return 0;
}
