#Program liczacy calke funkcji f(x)=2x+4
.data
SYSEXIT=1
EXIT_SUCCESS=0
a = 1
b = 2
prec = 10
two: .long 2
four: .long 4
.bss
#zmienne funkcji integral
.comm prec_i, 4
.comm a_i, 4
.comm b_i, 4
.comm result_i, 4

.comm result, 4

.comm h,4
.comm a_h, 4
.comm x, 4
.text
.global main

.type height, @function
.type value_f, @function

main:

movq $0, %rsi
movq $prec, %rdi
movq %rdi, prec_i(,%rsi,4)
movq $a, a_i
movq $b, b_i

flds b_i
fsub a_i
fwait
fidiv prec_i

fstps result_i
fldz

loop:
movsd a_i, %xmm0
movsd result_i, %xmm1

call height
call value_f

#zapis wyniku do rejestru
movsd %xmm0,result
fadd result
#dekrementacja licznika odpowiadajacego za precyzje i liczbe podzialu funkcji
dec %rdi

cmp $0, %rdi
je exit_loop
jmp loop

exit_loop:
#pomnozenie przez (b_i-a_i)/prec_i wyniku
fmul result_i
fwait
fstps result
#wynik zostaje umieszczony w rejestrze %xmm0 
movsd result, %xmm0

mov $SYSEXIT, %rax
mov $EXIT_SUCCESS, %rdi
int $0x80

#funkcja obliczajaca wysokosc prostokata poprzez podzielenie osi x i powstalego przedzialu na ilosc modulow okreslone przez prec 
height:
pushq %rbp
movq %rsp, %rbp
#przekazywnie do funkcji argumentow poprzez zapis ich do rejestrow
movq %rdi, prec_i(,%rsi,4)
movsd %xmm0, a_h
movsd %xmm1, h

fild prec_i
fmul h
fadd a_h
fwait

fstps result
movsd result, %xmm0

movq %rbp, %rsp
popq %rbp
ret

#funkcja obliczajaca wartosc dla funkcji x, która jest wartoscia kolejnych podzialow osi x
value_f:
pushq %rbp
movq %rsp, %rbp

#zapis przekazanej wartosci do funkcji do zmiennej x
movsd %xmm0, x
flds x
fimul two

fiadd four
fwait
fstps result

#umieszczenie wyniku w rejestrze
movsd result, %xmm0

movq %rbp, %rsp
popq %rbp
ret


