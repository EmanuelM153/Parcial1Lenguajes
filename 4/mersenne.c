#include <stdio.h>

int main() {
    int i, j, n, p;
    for (i = 2; i < 40; i++) {
        n = (1 << i) - 1;
        p = 1;
        for (j = 2; j < n; j++) {
            if (n % j == 0) {
                p = 0;
                break;
            }
        }
        if (p) {
            printf("%d\n", n);
        }
    }
    return 0;
}
