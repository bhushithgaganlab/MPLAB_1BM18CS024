.model small
display macro msg
lea dx,msg
mov ah,09h
int 21h
endm

.data
msg1 db 0dh,0ah,"Enter the first string $"
msg2 db 0dh,0ah,"Enter the second string $"
msg3 db 0dh,0ah,"Entered Strings are equal $"
msg4 db 0dh,0ah,"Entered strings are not equal $"
str1 db 10h dup(0)
str2 db 10h dup(0)
len1 dw 0
len2 dw 0

.code
mov ax,@data
mov ds,ax
display msg1
mov si,00h

back1:
       
        mov ah,01h
        int 21h
        cmp al,0dh
        jz next1
        mov str1[di],al
        inc si
        inc len1
        loop back1

next1: display msg2
        mov di,00h
        jmp back2

back2:  mov ah,01h
        int 21h
        cmp al,0dh
        jz next2
        mov str2[di],al
        inc di
        inc len2
        jmp back2

next2: mov si,len1
        mov di,len2
        cmp si,di
        jnz notsame
        mov si,00h
        mov di,00h
        cld
        jmp back3

back3: mov bl,str1[si]
        cmp bl,str2[di]
        jnz notsame
        loop back3
        display msg4
        jmp last

notsame: display msg3
last:   mov ah,4ch
        int 21h
        end
