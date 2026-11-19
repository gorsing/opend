// ARG_SETS: -i=,
// ARG_SETS: -i=imports.pkgmod313,
// ARG_SETS: -i=,imports.pkgmod313
// ARG_SETS: -i=imports.pkgmod313,-imports.pkgmod313.mod
// ARG_SETS: -i=imports.pkgmod313.package,-imports.pkgmod313.mod
// REQUIRED_ARGS: -Icompilable
// LINK:
/*
TEST_OUTPUT:
----
$r:.+undefined reference to .*bar.*$
Error: $r:.+$ exited with status $n$
----
*/
import imports.pkgmod313.mod;
void main()
{
    bar();
}
