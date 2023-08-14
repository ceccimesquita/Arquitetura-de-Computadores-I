;
;   Building Instructions:
;   ml /Cx /coff questao5a.asm /link /SUBSYSTEM:console /out:questao5a.exe kernel32.lib legacy_stdio_definitions.lib msvcrt.lib
;
        .686
        .model  flat, c
        .stack  100h
printf  PROTO   arg1:Ptr Byte, printlist:VARARG
scanf   PROTO   arg2:Ptr Byte, inputlist:VARARG
        .data
msg1fmt byte   0Ah, "%s%d%s%d%s%d",0Ah,0 

msg1    byte    "Para x = ", 0
msg2    byte    " dividido por y = ", 0
msg3    byte    " o resultado e: ", 0
x       sdword 10
y       sdword 2

result  sdword 0
        .code
main    proc
        mov eax, x
        mov ebx, y
        mov edx,eax
        mov eax, 0
        .while( edx >= ebx)
        sub edx, ebx
        inc eax
        .endw
        mov result, eax
        INVOKE printf, ADDR msg1fmt, ADDR msg1, x, ADDR msg2, y, ADDR msg3, result
main    endp
        end