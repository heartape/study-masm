assume cs:code,ss:stack
stack segment
    dw 0
stack ends

code segment
start:

    mov ax,stack
    mov ss,ax
    mov sp,10H

    mov ax,4241H
    mov dx,000FH
    mov cx,0AH
    call divdw

    mov ax,4c00H
    int 21H

divdw:
	push bx

	; 计算高位
	mov bx,ax
	mov ax,dx
	mov dx,0
	div cx

	; 高位商压栈
	push ax

	; 计算低位
	mov ax,bx
	div cx

	; 整理结果
	mov cx,dx
	pop dx

	pop bx
 	ret

code ends
end start