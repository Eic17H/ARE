#include <stdio.h>

int fun1(int, int);
int fun2(int, int);

int main() {
    int x, y, z;
    scanf("%d", &x);
    scanf("%d", &y);
    scanf("%d", &z);

    printf("%d", fun1(y, fun2(y, z+x)) + fun2(x, z) + x%3);
    return 0;
}

int fun1(int a, int b){
    for(int i=4; i-8<0; i++){
        a = a+2;
        }
    if(5-a < 0){
        a = a+b/2;
        }
    else{
        b = b-2;
        }
    return a + b + a%4;
}

int fun2(int a, int b){
    while(a-b < 0){
        a = a+2;
        }
    if(b+2-a < 0){
        b = b-1;
        }
    else{
        b = b+3;
        a = a+4;
        }
    return a + b/3;
}
