#include<stdio.h>
#define LIMIT 50
void main(void)
{
    char input[50];
    get1line(input,LIMIT);
    reverse(input,LIMIT);
}
void reverse (char s[],int lim)
{
        int temp,i=0;
        char c[lim];
        while (1)
        {
            if (s[i]=='\0')
            break;
            else
            i++;
        }
        printf("\n I=%d",i);
        int j;
        for (j=0; j<=(i);j++)
        {
            c[j]=s[(i-1)-j];
        }
        c[++j]='\0';
        printf("%s",c);

}

int get1line(char s[], int lim)
{
    int c, i;

    for (i=0; i<lim-1 && (c = getchar())!=EOF && c!='\n'; ++i)
        s[i] = c;
  //  if (c == '\n') {
    //    s[i] = c;
    //}
    s[i] = '\0';
    return(i);
}
