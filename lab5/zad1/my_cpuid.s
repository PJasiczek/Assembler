SYSWRITE=4
STDOUT=1
SYSEXIT=1
EXIT_SUCCESS=0

.bss
.text

.global my_cpuid

.type my_cpuid, @function
my_cpuid:
pushq %rbp
#zapisanie wskażnika
mov %rsp, %rbp
#wskażnik stosu staje się wskażnikiem dzięki któremu dostaniemy sie do zmiennych
sub $4, %rsp
mov 8(%rbp), %rbx
#przekazanie argumentu do funkcji

loop_cpuid_start:
cmp $0, %rbx
#pierwszy warunek funkcji
je loop

cmp $1, %rbx
#drugi warunek funkcji
je loop1

cmp $1, %rbx
#trzeci warunek funkcji dla pozostałych argumentów
jg loop2


loop:
movq $0,-4(%rbp)
#stworznie zmiennej lokalnej
mov -4(%rbp), %rcx
rdtscp
inc %rcx
cmp $10, %rcx
jge loop


loop1:
xor %rax,%rax
cpuid
rdtsc

loop2:
rdtscp

end_cpuid:
mov %rbp, %rsp
popq %rbp
ret
