.data
SYSEXIT=1
EXIT_SUCCES=0
.align 32
i: .float 0, 1, 2, 3
four: .float 4, 4, 4, 4
zero: .float 0, 0, 0, 0
two: .float 2, 2, 2, 2

result: .float 0
result2: .float 0
result3: .float 0
result4: .float 0

.bss
.text

.global integrate_sse


integrate_sse:
cvtsi2ss %edi, %xmm1
cvtsi2ss %esi, %xmm0
cvtsi2ss %edx, %xmm2

subss %xmm1, %xmm0
divss %xmm2, %xmm0

shufps $0x00, %xmm0, %xmm0
shufps $0x00, %xmm1, %xmm1

movaps i, %xmm6
mulps %xmm0, %xmm6 #zostaje przemnozona wartosc (b-a)/n przez wektor [0,1,2,3]
addps %xmm6, %xmm1

movaps four, %xmm5
mulps %xmm0, %xmm5

movaps zero, %xmm2 #inicjalizacja zerami rejestru do ktorego zostanie wprowadzony wynik kolejnych sumowan
shrl $2, %edx

loop:
	cmpl $0, %edx
	je end_loop
	dec %edx


	movaps %xmm1, %xmm6
#obiczona wartosc dla funkcji f(x)=2x+4
	mulps two, %xmm6
	addps four, %xmm6
	mulps %xmm0, %xmm6

	addps %xmm6, %xmm2
	addps %xmm5, %xmm1
	jmp loop

end_loop:

movaps %xmm2, result

movss result, %xmm0
movss result2, %xmm1
movss result3, %xmm2
movss result4, %xmm3

addss %xmm1, %xmm0
addss %xmm2, %xmm0
addss %xmm3, %xmm0

ret
