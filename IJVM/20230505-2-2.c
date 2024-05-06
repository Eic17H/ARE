#include<stdio.h>

int main() {
    int x, y, z;
    scanf("%d", &x);
    scanf("%d", &y);
    scanf("%d", &z);
    printf("%d", fun1(x+y ,fun2(y)) + fun2(y));
    return 0;
}

int fun1(int x, int y) {
    for (int j = 1; j <4; j++){
        y = y + 3;
    }
    if(x%2 != 0){
        y = y+2;
        x--;
    }
    else{
        x++;
        y--;
    }
    return x + y;
}
int fun2(int b){
    while(b%2 != 0){
        b = ++b;
    }
    if(b > 5){
        b= b-2;
    }
    if(b==5){
        b=6;
    }
    return b+3;
}