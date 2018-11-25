#include<stdio.h>
#include<math.h>
int A,B,Adec;
float X,Y;
//int A=0;int B=0;
int hex_to_dec(int);
float formula1(float);
float formula0(float);
float ifA_is_X(float q);
float ifA_is_Y(float q);
void main(void)
{

    printf("A= ");
    scanf("%d",&Adec);
    printf("B= ");
    scanf("%d",&B);
   // while (!(scanf("Enter Decimal value %d",&B))) ;
   // int Adec = hex_to_dec(A);
    printf("\nA=\t%d   B=\t%d",Adec,B);
    //let X=A
    printf("\nif X=A ==%f",ifA_is_X(A));

    //let X=B
    printf("\nif Y=A ==%f",ifA_is_Y(A));

    printf("\nif X=B ==%f",ifA_is_X(B));

    printf("\nif Y=B ==%f",ifA_is_Y(B));
}

int hex_to_dec(int x)
{
      int decimal_number, remainder, count = 0;
      while(x > 0)
      {
            remainder = x % 10;
            decimal_number = decimal_number + remainder * pow(16, count);
            x = x / 10;
            count++;
      }
      return decimal_number;
}

float ifA_is_X(float q)
{
    return formula1(q);
}

float ifA_is_Y(float q)
{
    return formula0(q);
}
float formula1(float Y)
{
    float offset,resolution;
    offset=-50;
    resolution=0.1;
    X=(Y*resolution)+offset;
    return X;
}
float formula0(float Y)
{
    float offset,resolution;
    Y=(X-offset)/resolution;
    return Y;
}

