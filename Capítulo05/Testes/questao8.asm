;   TESTE NÂO COMPLETO
;   Building Instructions:
;   ml /Cx /coff questao8.asm /link /SUBSYSTEM:console /out:questao8.exe kernel32.lib legacy_stdio_definitions.lib msvcrt.lib
;
        .686
        .model  flat, c
        .stack  100h
printf  PROTO   arg1:Ptr Byte, printlist:VARARG
scanf   PROTO   arg2:Ptr Byte, inputlist:VARARG
        .data
msg1fmt byte    "%d",0Ah,0 
sun     sdword ?
i       sdword ?
        .code
main    proc
        mov ecx, 2
for01:  nop
        mov tempecx, ecx
        mov ecx, 3
for02:  nop
        ; body of nested loop
        loop for1
endfor02: nop
        mov ecx, tempecx
endfor01: nop
        INVOKE printf, ADDR msg1fmt, sun
        INVOKE printf, ADDR msg1fmt, i
main    endp
        end