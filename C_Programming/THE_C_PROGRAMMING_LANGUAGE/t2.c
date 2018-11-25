#include<stdio.h>
void main()
{
    int a=5;
    int b[]={1,2,3};
    printf("%d",sizeof(b));
    printf("\nmain %d %d %d %d \n",a,b[0],b[1],b[2]);
    power(a,b);
    printf("\nmain %d %d %d %d \n",a,b[0],b[1],b[2]);

}

int power(int a,int b[])
{
    int i;
    printf("a=%d\n",a);
    ++a;
    printf("+a=%d\n",a);
    for (i=0;i<=2;i++){
    printf("b=%d  ",++b[i]);
    }

}
