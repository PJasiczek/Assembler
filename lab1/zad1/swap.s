#Program zamieniający kolejność liter w łańcuchu znaków 
SYSEXIT=1
SYSREAD=3
SYSWRITE=4
STDOUT=1
EXIT_SUCCESS=0
BUFLEN=512

.bss
.comm output,512

.text
msg_swap: .ascii "Ala ma tablet"
msg_swap_len = . - msg_swap
new_line: .ascii "\n"
new_line_len = . - new_line

.global _start

_start:
mov $0, %edi
mov $msg_swap_len, %edx
dec %edx
jmp loop

loop:
movb msg_swap(,%edi,1), %al
movb msg_swap(,%edx,1), %ah
movb %al,output(,%edx,1) 
movb %ah,output(,%edi,1) 
inc %edi

cmp %edx, %edi
jge show #jesli indeks znajdujacy sie w %edi jest wiekszy od indeksu w %edx wtedy skocz do show 
dec %edx
jmp loop

show:
movl $SYSWRITE, %eax
movl $STDOUT, %ebx
movl $output, %ecx
movl $BUFLEN, %edx
int $0x80

movl $SYSWRITE, %eax
movl $STDOUT, %ebx
movl $new_line, %ecx
movl $new_line_len, %edx
int $0x80

movl $SYSEXIT, %eax
movl $EXIT_SUCCESS, %ebx
int $0x80
