/*
   Building Instructions:
   cl questao5_2.c
*/
  
#include <stdio.h>
int main() {
  long double x, y;
  printf("\n%s", "Enter a long double for x: ");
  scanf_s("%Lf", &x);

  __asm {
	fld x
	fstp y
  }
  
  printf("\n%s%6.4Lf\n\n", "The long double in y is: ", y);
  return 0;
}