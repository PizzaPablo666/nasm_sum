section	.text
   global _start    
	
_start:             
  
   mov 	ebx, 4       ;const 4 is in ebx register
   add 	ebx, [num1]  ; num1 + num2 
   mov 	[sum], ebx


   mov	ecx,msg	
   mov	edx, len
   mov	ebx,1	;stdout number
   mov	eax,4	;system call number (sys_write)
   int	0x80	;call kernel
	
   mov	ecx, sum
   mov	edx, 1
   mov	ebx,1	;file descriptor (stdout)
   mov	eax,4	;system call number (sys_write)
   int	0x80	;call kernel


   mov ecx, [sum]
   sub ecx, '0' ;decimal num

	
   mov	eax, 1   ;system call number (sys_exit)
   mov  ebx, ecx ; return code
   int	0x80	;call kernel
	
section .data
   msg db "The sum is:", 0xA,0xD 
   len equ $ - msg
   num1 dd '3' ; this should be in ' ' idk why   
   segment .bss
   sum resb 1
