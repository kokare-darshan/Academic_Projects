#include<stdio.h>
void main()
{
    int p=9;
    fucking(&p);
    printf("%d",p);
    char a[11]={'a','b','3','d','\0','a','h','4','d','g'};
    printf("\n %s",a);
}
void fucking (int *a)
{

    *a=*a+1;
}
