/*
EXTRA_FILES: imports/ice21060a/package.d imports/ice21060b/package.d imports/ice21060c/package.d imports/ice21060d/package.d
TEST_OUTPUT:
---
fail_compilation/ice21060.d(13): Error: from file package.d must be imported with 'import imports.ice21060d;'
---
*/
struct S21060
{
    void print()
    {
        import imports.ice21060a;
        import imports.ice21060b;
    }
}
// OpenD: suppress intentional deprecations
// REQUIRED_ARGS: -d
