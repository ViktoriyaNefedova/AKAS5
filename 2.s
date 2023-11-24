section .data
    buffer equ 256 ; Размер буфера для строки       

section .bss
    input resb buffer ; Выделение памяти под входную строку   

section .text
    global _start

_start:
    ; Чтение строки из stdin
    mov eax, 3 ; Системный вызов для чтения          
    mov ebx, 0 ; Стандартный ввод         
    mov ecx, input ; Буфер для чтения      
    mov edx, buffer  ; Размер буфера     
    int 0x80             

    ; Вывод строки в stdout
    mov eax, 4  ; Системный вызов для записи         
    mov ebx, 1  ; Стандартный вывод         
    mov ecx, input ; Адрес буфера для записи   
    mov edx, buffer  ; Размер буфера    
    int 0x80             

    ; Выход из программы
    mov eax, 1  ; Системный вызов для выхода         
    xor ebx, ebx    ; Возврат кода завершения 0     
    int 0x80             
