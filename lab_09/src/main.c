#include <stdio.h>

#define ADMIN_SUM 666
#define MAX_BUFFER_SIZE 100

size_t control_sum(const char *string) {
    size_t sum = 0;
    for (size_t i = 0; string[i]; sum += string[i], i++);
    return sum;
}

int main() {
    char string[MAX_BUFFER_SIZE];

    scanf("%s", string);
    if (control_sum(string) == ADMIN_SUM)
        printf("Welcome, admin!\n");
    else
        printf("Welcome, guest!\n");

    return 0;
}
