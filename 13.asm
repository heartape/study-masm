assume cs:code

data segment
	db "welcome to masm!",0
data ends

code segment
start:
	push ds
	push es

	mov ax,cs
	mov ds,ax
	mov si,offset do0

	mov ax,0
	mov es,ax
	mov di,200h

	mov cx,offset do0end - offset do0
	cld
	rep movsb

	mov ax,0
	mov es,ax
	mov word ptr es:[7ch*4],200h
	mov word ptr es:[7ch*4+2],0

	; 检验#################
	push dx
	push cx

    mov dh,10
    mov dl,10
    mov cl,2

    mov ax,data
    mov ds,ax
    mov si,0

    int 7ch

    pop cx
    pop dx
	; 检验#################

	pop es
	pop ds

	mov ax,4c00h
	int 21h

do0:
	push ax
	push cx
	push ds
	push es

	mov ax,0b800h
	mov es,ax
	mov di,12*160+36*2

s:
	mov ch,0
	mov cl,[si]
	jcxz ok
	mov ch,3
	mov es:[di],cx
	inc si
	add di,2
	jmp short s

ok:
	pop es
	pop ds
	pop cx
	pop ax
	iret

do0end:
	nop
code ends

end start