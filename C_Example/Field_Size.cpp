#include <stdio.h>

int main(void)
{
	int a = 125;
	printf("%d\n", a);
	printf("양수를 사용하면 오른쪽 정렬 %5d\n", a);
	printf("%-5d\n", a);
	printf("%0d\n", a);
	printf("%05d\n", a);
	printf("%0-5d\n", a);
	
	return 0;
}

