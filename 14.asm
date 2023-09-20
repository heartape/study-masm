assume cs:code
data segment
	db 17 dup(0)
data ends
code segment
start:
	mov ax,data
	mov ds,ax
	mov si,0
	; 年
	mov al,9
	call far ptr do_move

	mov byte ptr ds:[si],47
	inc si
	; 月
	mov al,8
	call far ptr do_move

	mov byte ptr ds:[si],47
	inc si
	; 日
	mov al,7
	call far ptr do_move

	mov byte ptr ds:[si],32
	inc si

	; 时
	mov al,4
	call far ptr do_move

	mov byte ptr ds:[si],58
	inc si
	; 分
	mov al,2
	call far ptr do_move

	mov byte ptr ds:[si],58
	inc si
	; 秒
	mov al,0
	call far ptr do_move

	jmp short do_show

do_move:
	out 70h,al
	in al,71h
	mov ah,al
	mov cl,4
	shr ah,cl
	and al,00001111b
	add ah,30h
	add al,30h
	mov ds:[si],ah
	mov ds:[si+1],al
	add si,2
	ret

do_show:
	mov si,0
	mov ax,0b800h
	mov es,ax
	mov di,12*160+36*2
	mov cx,17

s:
	mov al,[si]
	mov ah,3
	mov es:[di],ax
	inc si
	add di,2
	loop s

ok:
	mov ax,4c00h
	int 21h
code ends

end start