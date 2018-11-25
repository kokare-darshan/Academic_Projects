#include<stdio.h>
#define LIMIT 50
void main(void)
{
    char input[50];
    get1line(input,LIMIT);
}

int get1line(char s[], int lim)
{
    int c, i;

    for (i=0; i<lim-1 && (c = getchar())!=EOF && c!='\n'; ++i)
        s[i] = c;
    if (c == '\n') {
        s[i] = c;
    }
    s[i] = '\0';
    return(i);
}
