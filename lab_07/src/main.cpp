#include <cstdio>
#include <iostream>
#include <cstring>

using namespace std;

extern "C" {
    void strcopy(char *dest, const char *src, size_t size);
} 

#define MAX_BUFFER_LEN 100

size_t my_strlen(const char *buffer) {
    size_t cnt;
    //__asm__(".intel_syntax noprefix\n\t"
            //"xor rcx, rcx\n\t"
            //"not rcx\n\t"
            //"mov al, 0\n\t"
            //"mov rdi, %1\n\t"
            //"repne scasb\n\t"
            //"not rcx\n\t"
            //"dec rcx\n\t"
            //"mov %0, rcx\n\t"
            //: "=r"(cnt) : "r"(buffer) : "rcx", "rdi", "al"
           //);
    __asm__("xor %%rcx, %%rcx\n\t"
            "not %%rcx\n\t"
            "movb $0, %%al\n\t"
            "movq %1, %%rdi\n\t"
            "repne scasb\n\t"
            "not %%rcx\n\t"
            "dec %%rcx\n\t"
            "mov %%rcx, %0\n\t"
            : "=r"(cnt) : "r"(buffer) : "rcx", "rdi", "al"
           );
    return cnt;
}

int main()
{
    char buffer[MAX_BUFFER_LEN];
    int cnt;
    scanf("%s", buffer);

    cout << "Library strlen: " << strlen(buffer) << "\nMy asm strlen: " << my_strlen(buffer) << endl;

    char src[] = "String, to copy from...";
    char dest[MAX_BUFFER_LEN] = "Here is just cringe...";
    strcopy(dest, src, strlen(src));
    cout << "Test1 (simple test, copy from source to destination different memory addresses at all):\n";
    cout << "Src: " << src << "\nDest: " << dest << endl;

    char special_check[] = "abcdefghijklmnopqrstuvwxyz";

    cout << "Test2: Destination = Source + 4, copysize: 8\n";
    cout << "Start: " << special_check << endl;
    strcopy(special_check + 4, special_check, 8);
    cout << "Mine:  " << special_check << endl;

    cout << "Test3: Source = Destination + 4, copysize: 8\n";
    cout << "Start: " << special_check << endl;
    strcopy(special_check, special_check + 4, 8);
    cout << "Mine:  " << special_check << endl;
    return 0;
}
