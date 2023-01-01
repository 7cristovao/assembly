; instalar nasm
; Compilar: transforma o programa para linguagem de maquina
; sudo nasm -f elf32 -o hello.o hello.asm 
; Linkeditar: transforma o programa em linguagem de maquina
;             para um executavel
; sudo ld -s -o hello hello.o

section .data
    msg db 'Hello world!', 0xA ; mensagem com quebra de linha
    tam equ $- msg ; funcao length
    msgC db 'Hello world!', 0xA ; mensagem com quebra de linha

section .text

global _start

_start:
    mov EAX, 0x4 ; Quer fazer uma saida
    mov EBX, 0x1 ; Saida padrao
    mov ECX, msg ; minha mensagem
    mov EDX, tam ; meu tamanho
    int 0x80

saida:
    ; destino, origem EAX = 1
    mov EAX, 0x1 ; base HEX: representado com 0x na frente
                 ; SO estou terminando o programa
    mov EBX, 0x0 ; SO o valor de retorno eh 0
    int 0x80