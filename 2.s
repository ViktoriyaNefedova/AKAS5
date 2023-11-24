section .data
	input_msg db 'Entering a line: '
	output_msg db 'Line output: '
	buffer db 64

section .text
	global _start

_start:
	; выводим сообщение для ввода строки
	mov eax, 4
	mov ebx, 1
	mov ecx, input_msg
	mov edx, 17
	int 0x80

	; считываем строку из stdin
	mov eax, 3
	mov ebx, 0
	mov ecx, buffer
	mov edx, 64
	int 0x80

	; выводим сообщение с введенной строкой
	mov eax, 4
	mov ebx, 1
	mov ecx, output_msg
	mov edx, 13
	int 0x80

	; выводим введенную строку
	mov eax, 4
	mov ebx, 1
	mov ecx, buffer
	int 0x80

	; завершаем программу
	mov eax, 1
	xor ebx, ebx
	int 0x80
