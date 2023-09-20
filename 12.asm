assume cs:code

code segment
start:
	mov ax,cs
	mov ds,ax
	mov si,offset do0

	mov ax,0
	mov es,ax
	mov di,200h

	mov cx,offset do0end - offset do0
	cld ;设置si di循环方向
	rep movsb

	mov ax,0
	mov es,ax
	mov word ptr es:[0],200h
	mov word ptr es:[2],0

	; 检验#################
	mov ax,1000h
    mov bh,1
    div bh
    ; 检验#################

	mov ax,4c00h
	int 21h

do0:
	jmp short do0start
	db "divide error!!!"

do0start:
	mov ax,cs
	mov ds,ax
	mov si,202h

	mov ax,0b800h
	mov es,ax
	mov di,12*160+36*2

	mov cx,15

s:
	mov al,[si]
	mov ah,2
	mov es:[di],ax
	inc si
	add di,2
	loop s

	mov ax,4c00h
	int 21h

do0end:
	nop
code ends

end start