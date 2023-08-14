/*
    Building Instructions:
    cl.exe questao7.c
*/

#include <stdio.h>

int main (){
     int num1, num2, num3;

     printf("\n%s", "Enter a number: ");
     scanf("%d", &num1);
     printf("%s", "Enter a larger number: ");
     scanf("%d", &num2);
     printf("%s", "Enter an even larger\nnumber: ");
     scanf("%d", &num3);

     printf("\n%d%s%d%s%d\n", num1, "  <  ", num2, "  <  " , num3);
     printf("\n%d%s%d%s%d\n\n", num3, "  >  ", num2, "  >  " , num1);
     return 0;
}