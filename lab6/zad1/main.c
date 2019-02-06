#include <stdio.h>

#define SIZE 9000
extern long long unsigned my_cpuid(int n);
long long unsigned int t;
long long unsigned int t1;
long long unsigned int A[SIZE][SIZE];
int B[SIZE];
int b;

int main()
{

int i=0;
int j=0;
long long unsigned int result=0;
long long int sum=0;

	for(i=0; i<1024; i++)
	{
		t = my_cpuid(0);
		sum +=B[i];
		t1 = my_cpuid(0) - t;
		printf("%i \t %llu \n", i, t1);
	}


	//dla tablicy dwowymiarowej
        t=my_cpuid(0);
	for(i=0; i< 64; i++)
        {
		for(j=0; j< SIZE;j++)
		{
                sum+=A[i][j];
		}
	}
	t1=my_cpuid(0)-t;
printf("Macierz %llu \n",t1);

	//macierz transponowana
	t=my_cpuid(0);
	for(i=0; i< 64; i++)
        {
                for(j=0; j< SIZE;j++)
                {
                sum+=A[j][i];
                }
        }
	t1=my_cpuid(0)-t1;
printf("Macierz transponowana %llu \n",t1);


return 0;

}
