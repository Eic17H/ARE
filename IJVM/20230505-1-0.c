#include<stdio.h>

// 1, 2, 3: 59

int fun1(int a, int b, int c);
int fun2(int b);

int main(){
    int x, y, z;
    scanf("%d", &x);
    scanf("%d", &y);
    scanf("%d", &z);
    printf("%d", fun1(x+z,y,z) + fun2(x+y));
}

int fun1(int a, int b, int c){
    while(c>b){
        b++;
    }
    if(b>a){
        b=b+a/2+c;
    }else{
        b=b+a;
    }
    a=a+fun2(a);
    return a+c-b;
}

int fun2(int b){
    for(int i=10 ;i>5; i--){
        b=b+3;
    }
    if(b<10){
        b=b++;
    }else{
        b=b+b/2;
    }
    return b+2;
}