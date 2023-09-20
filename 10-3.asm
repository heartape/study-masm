assume cs:code

data segment
    db 10 dup (0)
data ends

code segment
start:
		mov ax,data
		mov ds,ax
		mov ax,12666
		mov si,0
		call dtoc

		; 读取
		mov dh,8
		mov dl,3
		mov cl,2
		call show_str

		mov ax,4c00h
		int 21h

dtoc:
		push bx
		push cx
		push dx
		; data指针
		mov si,10
		; 除数
		mov bx,10

s:
		mov dx,0
		div bx
		; ascll, 数字转换为字符,因为除数是10,所以余数在一个字节范围内
		add dl,48
		dec si
		mov byte ptr [si],dl
		mov cx,ax
		jcxz s0
		jmp short s

s0:
		pop dx
		pop cx
		pop bx
		ret

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