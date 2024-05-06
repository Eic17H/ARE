#include<stdio.h>

int fun1(int, int);
int fun2(int);

int main(){
    int x, y, z;
    scanf("%d", &x);
    scanf("%d", &y);
    scanf("%d", &z);

    printf("%d %d %d", fun1(fun2(y+1), x+z), fun2(x), fun1(fun2(y+1), x+z) + fun2(x));
    return 0;
}

int fun1(int x, int y){
    while(x+y < 12){
        y = y +2;
        x = x + 1;
    }
    if(x%2 == 0){
        x=x+3;
        y=y+2;
    }else{
        x=x+2;
        y=y+2;
    }
    return x + y;
}

int fun2(int b){
    if(b == 0){
        b=6;
    }
    if (b < 5){
        b=5;
    }
    while (b%3 != 0){
        b = ++b;
    }
    return b+3;
}