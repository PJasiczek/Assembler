#include <stdio.h>

extern long long unsigned my_cpuid(int n);

int main(void){

	long long unsigned t;
	
	t = my_cpuid(1);
	int x=0;
	t = my_cpuid(1) - t;

	printf("%llu \n",t);
	
	return 0;
}
