assume cs:code

data segment
    db 'Welcome to masm!',0
data ends

code segment
start:
		mov dh,8
		mov dl,3
		mov cl,2
		mov ax,data
		mov ds,ax
		mov si,0
		call show_str

		mov ax,4c00h
		int 21h

show_str:
		push ax
		push bx
		push cx
		push si
		push es
		push dx
		; 显存段地址
		mov ax,0b800h
		mov es,ax
		; 显存地址偏移
		mov ax,80
		mul dh
		mov dh,0
		add ax,dx
		inc ax
		mov bx,ax
		mov dl,cl

change:
		mov cl,[si]
		mov ch,0
		jcxz ok
		mov byte ptr es:[bx],cl
		mov byte ptr es:[bx + 1],dl
		add bx,2
		inc si
		jmp short change

ok:
		pop dx
		pop es
		pop si
		pop cx
		pop bx
		pop ax
		ret

code ends

end start