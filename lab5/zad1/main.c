#include <stdio.h>

extern long long unsigned my_cpuid(int n);
extern float integrate_sse(unsigned int a, unsigned int b, unsigned int n);


int main(void)
{
	unsigned long long t, t1;

	double result = 0;

	t = my_cpuid(0);
	result = integrate_sse(1,2,10);
	t1 = my_cpuid(0) - t;

	printf("Wynik calkowania: %lf i porownania %llu \n",result, t1);

	return 0;
}
