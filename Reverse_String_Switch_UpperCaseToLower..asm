org 100h
include 'emu8086.inc'  
 

printn
printn "Press 1 go to Answer 1:"   

printn
printn "Press 2 go to Answer 2:" 

printn
printn "Press 3 go to Answer 3:" 

printn
printn "Press 4 go to Answer 4:" 

question:
printn
printn "Enter a Question number 1,2,3,or 4"
lea di,buffer
mov dx,SIZE
call get_string 



cmp [di],31h
je Answer1

cmp [di],32h
je Answer2

cmp [di],33h
je Answer3

cmp [di],34h
je Answer4 

jmp Redo


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 

Redo:
jmp question

Answer1:
 
printn
printn "Enter a string"
lea di,buffer
mov dx,SIZE
call get_string     

printn      
printn "Original string is"
mov si,di
call print_string

printn
printn "Answer 1:"   

mov bx,di 


first1:
   
mov al,[bx]

cmp al,0
je question
jna toLower1


toLower1:
 

add al, 20h
mov ah, 0eh 
int 10h 
inc bx  
jmp first1 

;;;;;;;;;;;;;;;;;;;;;;;;


Answer2:
   
printn
printn "Enter a string"
lea di,buffer
mov dx,SIZE
call get_string     

printn      
printn "Original string is"
mov si,di
call print_string

printn
printn "Answer 2:"   

mov bx,di 


first2:
   
mov al,[bx]

cmp al,0
je question 

cmp al,'Z'
jle toLower2

cmp al,'z'
jle toUpper2 


toLower2: 
add al, 20h 
jmp toPrint2 

toUpper2: 
sub al, 20h 
jmp toPrint2

toPrint2:
mov ah, 0eh 
int 10h 
inc bx
jmp first2 

;;;;;;;;;;;;;;;;;;;;;;;;;;;

Answer3:


printn
printn "Enter a string"
lea di,buffer
mov dx,SIZE
call get_string     

printn      
printn "Original string is"
mov si,di
call print_string

printn
printn "Answer 3:"   

mov bx,di 


first3:
   
mov al,[bx]

cmp al,0
je question 

cmp al,'A'
jl toPrint3

cmp al,'Z'
jle toLower3

cmp al,'a'
jl toPrint3

cmp al,'z'
jle toUpper3

cmp al,'z'
jg toPrint3 


toLower3: 
add al, 20h 
jmp toPrint3 

toUpper3: 
sub al, 20h 
jmp toPrint3

toPrint3:
mov ah, 0eh 
int 10h 
inc bx
jmp first3
            
;;;;;;;;;;;;;;;;;;;;;; 


Answer4:


printn
printn "Enter a string"
lea di,buffer
mov dx,SIZE
call get_string     

printn      
printn "Original string is"
mov si,di
call print_string

printn
printn "Answer 4:"   

mov bx,di 


first4:
   
mov al,[bx]

cmp al,0
je toPrint4 

cmp al,'A'
jl toStack 

cmp al,'T'
jle toLower4Version1

cmp al,'Z'
jle toLower4Version2

cmp al,'a'
jl toStack 

cmp al,'t'
jle toUpper4Version1

cmp al,'z'
jle toUpper4Version2 

cmp al,'z'
jg toStack 


toLower4Version1: 
add al, 20h
add al, 6h 
jmp toStack  

toLower4Version2: 
add al, 20h
sub al, 14h
jmp toStack 

toUpper4Version1: 
sub al, 20h
add al, 6h 
jmp toStack 

toUpper4Version2: 
sub al, 20h
sub al, 14h
jmp toStack

toStack:
push ax
inc bx
jmp first4


toPrint4: 
mov bx,sp
mov al,[bx]
mov ah, 0eh 
int 10h
pop ax

cmp sp,0
jne toPrint4
jmp question
                              
                  

hlt

buffer DB SIZE DUP(?) 
SIZE EQU 100   

define_get_string
define_print_string
end


