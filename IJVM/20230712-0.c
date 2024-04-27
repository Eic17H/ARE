#include <stdio.h>

int fun1(int, int);
int fun2(int, int);

int main() {
    int x, y, z;
    scanf("%d", &x);
    scanf("%d", &y);
    scanf("%d", &z);

    printf("%d", fun1(fun2(x, x+2), y+3) + fun2(y+1, z) - y%5);
    return 0;
}

int fun1(int a, int b){
    while(b>3){
        a = a+1;
        b = b-1;
    }
    if(a%3==0){
        a = a+2;
    }else{
        b = b-1;
    }
    return a+b-4;
}

int fun2(int a, int b){
    while(a<b+3){
        a = a+2;
    }
    if(a<7){
        b = b + a/2;
        a = a+3;
    }
    else{
        b = b-2;
        a = a+2;
        }
    return b + a + a%2;
}
