#Program zamieniajacy wielkie litery na male
SYSWRITE=4
SYSREAD=3
STDOUT=1
STDIN=0
SYSEXIT=1
EXIT_SUCCESS=0
BUFLEN=512

.bss
.comm input,512

.text
.global _start

_start:
movl $SYSREAD, %eax
movl $STDIN, %ebx
movl $input, %ecx
movl $BUFLEN, %edx
int $0x80

movl $0, %edi

loop:
movb input(,%edi,1), %al
cmp $10, %al
je show #jesli napotkamy znak konca teksu wtedy nastepuje przerwanie

cmpb $65, %al
jl change
cmpb $90, %al
jg change

lower:
addb $32, %al #dodanie obraszu dzielacego wielka i mala litere w tablicy ascii
jmp change

change:
movb %al, input(,%edi,1)

inc %edi
jmp loop

show:
movl $SYSWRITE, %eax
movl $STDOUT, %ebx
movl $input, %ecx
movl $BUFLEN, %edx
int $0x80

movl $SYSEXIT, %eax
movl $EXIT_SUCCESS, %ebx
int $0x80
