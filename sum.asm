SYS_EXIT  equ 1
SYS_READ  equ 3
SYS_WRITE equ 4
STDIN     equ 0
STDOUT    equ 1

segment .data 

   msg1 db "Enter first digit ", 0xA,0xD 
   len1 equ $- msg1 

   msg2 db "Enter second digit", 0xA,0xD 
   len2 equ $- msg2 

   msg3 db "The sum is: "
   len3 equ $- msg3

segment .bss

   num1 resb 5 
   num2 resb 5
   res resb  5
   cpres resb 5

section	.text
   global _start    ;must be declared for using gcc
	
_start:             ;tell linker entry point
   mov eax, SYS_WRITE         
   mov ebx, STDOUT         
   mov ecx, msg1         
   mov edx, len1 
   int 0x80                

   mov eax, SYS_READ 
   mov ebx, STDIN  
   mov ecx, num1 
   mov edx, 5
   int 0x80            

   mov eax, SYS_WRITE        
   mov ebx, STDOUT         
   mov ecx, msg2          
   mov edx, len2         
   int 0x80

   mov eax, SYS_READ  
   mov ebx, STDIN  
   mov ecx, num2 
   mov edx, 5
   int 0x80        

   mov eax, SYS_WRITE         
   mov ebx, STDOUT         
   mov ecx, msg3          
   mov edx, len3         
   int 0x80

   mov eax, [num1] ; copying num1 in register
   sub eax, '0'    ; eax is decimal now  (-'0' = -48)
	
   mov ebx, [num2] ; copying num2 in register
   sub ebx, '0'    ; ebx is decimal now

   add eax, ebx    ; the sum is in eax
   add eax, '0'    ; eax is ascii now

   ; storing the sum in memory location res
   mov [res], eax 
   

; print the sum 
 mov eax, SYS_WRITE        
 mov ebx, STDOUT
 mov ecx, [res]         
 mov edx, 5        
 int 0x80
exit:
  
	mov ecx, [res] 
	sub ecx, '0' ;decimal num
  
	mov eax, 1 ; function 1: exit()
	mov ebx, ecx  ; return code
	int 0x80 




