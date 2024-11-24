#include <stdio.h>

int main(){
    float n=15, c=0;
    int a, b;
    for(int i=0; i<n; i++)
        for(int j=0; j<n; j++)
            if(i*i+j*j<n*n)
                c++;
    b=n;
    b *= n;
    b /= 4;
    printf("%.0f\n%f", c, c/b);
    return 0;
}