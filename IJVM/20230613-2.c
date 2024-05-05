#include<stdio.h>

int fun1(int, int);
int fun2(int, int);

main(){
    int x, y, z;
    scanf("%d", &x);
    scanf("%d", &y);
    scanf("%d", &z);

    printf("%d", fun1(y,fun2(x,z)) + fun2(x,z) + z%3);
    return 0;
}

int fun1(int a, int b){
    for(int i=8;i>4;i--){
        a=a+1;
    }
    if(a>5){
        a= a+b;
    }else{
        b=b+b-2;
    }
    return a+b-3;
}

int fun2(int a, int b){
    while(a<5){
        a=a+2;
    }
    if(b>a+2){
        b=b-1;
    }else{
        b=b+3;
        a=a+2;
    }
    return a+b/2;
}