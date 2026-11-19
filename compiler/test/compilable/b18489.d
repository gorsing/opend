// REQUIRED_ARGS: -d -O -m64
import core.simd;

double dot (double2 a) {
    return a.ptr[0] * a.ptr[1];
}

void main () { }
