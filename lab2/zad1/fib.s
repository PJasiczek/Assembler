#Program wyznaczający kolejny wyraz ciagu fibbonaciego dla max NR_WYRAZU
SYSWRITE=4
SYSREAD=3
STDOUT=1
STDIN=0
SYSEXIT=1
EXIT_SUCCESS=0
NR_WYRAZU=7

.bss
.comm fib1, 256
.comm fib2, 256
.comm index,4
.text

.global main
main:

#ustawianie 1 jako pierwszej liczby
movl $0, %ebx
movl $NR_WYRAZU, %ecx
dec %ecx
add $1, %ebx
movl %ebx, fib2(,%ecx,4)

#przekopiowanie indeksu wyrazu ciagu fibonaciego
movl $NR_WYRAZU, %ebx
movl $0, %ecx
movl %ebx, index(,%ecx,4)
movl $1, %ecx #ustawiam licznika pętli

fib:
#zwiekszenie licznika petli i sprawdzenie czy podany wyraz ciagu jest parzysty czy nieparzysty
inc %ecx
movl %ecx, %eax
shr %eax
movl $0, %eax
adc $0, %eax
cmp $0, %eax
jne even


movl $NR_WYRAZU, %esi
dec %esi
movl fib1(,%esi,4), %eax
movl fib2(,%esi,4), %edx
add %edx, %eax
pushf
movl %eax, fib1(,%esi,4)
movl %eax, %edi #sprawdzenie poprzez gdb jaki wynik wyprowadził program dla kolejnego z ciagu fibonaciego
dec %esi

loop1:
movl fib1(,%esi,4), %eax
movl fib2(,%esi,4), %edx
popf
adc %edx, %eax
pushf
movl %eax, fib1(,%esi,4)
dec %esi
cmp $0, %esi
jne loop1
movl fib1(,%esi,4), %eax
movl fib2(,%esi,4), %edx
popf
adc %edx, %eax
movl %eax, fib1(,%esi,4)
dec %esi
cmp $0, %esi
jmp end_loop

even: #zapisanie wyniku w wyrazie ciagu o nieparzystym indeksie
movl $NR_WYRAZU, %esi
dec %esi
movl fib1(,%esi,4), %eax
movl fib2(,%esi,4), %edx
add %edx, %eax
PUSHF
movl %eax, fib2(,%esi,4)
movl %eax, %edi #sprawdzenie
dec %esi

loop2:
movl fib1(,%esi,4), %eax
movl fib2(,%esi,4), %edx
POPF
adc %edx, %eax
pushf
movl %eax, fib2(,%esi,4)
dec %esi
cmp $0, %esi
jne loop2
movl fib1(,%esi,4), %eax
movl fib2(,%esi,4), %edx
popf
adc %edx, %eax
movl %eax, fib2(,%esi,4)
dec %esi
cmp $0, %esi
jmp end_loop

end_loop:
movl $0, %edx
movl index(,%edx,4), %eax

cmp %eax, %ecx
jne fib

movl $SYSEXIT, %eax
movl $EXIT_SUCCESS, %ebx
int $0x80
