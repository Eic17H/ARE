#include<stdio.h>

int fun1(int, int, int);
int fun2(int, int);

int main(){
    int x, y, z;
    scanf("%d", &x);
    scanf("%d", &y);
    scanf("%d", &z);
    printf("%d", fun1(fun2(y, z),y ,z+x) + fun2(y + 2, x));
    return 0;
}

int fun1(int a, int b, int c){
     while (a % 2 == 0 ) {
     if (b < 5) {
     a = c * 3;
     c++;
     } else {
     a = b * 5;
     b++;
     }
     }
     return c;
}

int fun2(int a, int b){
    if(a + b > 6) {
        for(int i = 0; i < 4; i++) {
    a = b * 2;
    }
    }
    else {
    b = a + 2;
    a = a + 3;
    }
        return a + b + 1;
}