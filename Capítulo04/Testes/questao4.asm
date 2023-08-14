;
;   Building Instructions:
;   ml /Cx /coff questao4.asm /link /SUBSYSTEM:console /out:questao4.exe kernel32.lib legacy_stdio_definitions.lib msvcrt.lib
;
        .686
        .model  flat, c
        .stack  100h
printf  PROTO   arg1:Ptr Byte, printlist:VARARG
scanf   PROTO   arg2:Ptr Byte, inputlist:VARARG
        .data
msg1fmt byte    "%d",0Ah,0 
a   sdword 2
b   sdword 4
k   sdword 7
d   sdword 6
        .code
main    proc
        mov eax, b
        mov ebx, k
        .if  a > eax
        dec a
        .else
        .if eax >= ebx
        sub eax, 2
        .else 
        .if ebx > d
        add ebx,d
        .else
        mov edx, d
        imul edx, 2
        .endif
        .endif
        .endif
        INVOKE printf, ADDR msg1fmt, a
        INVOKE printf, ADDR msg1fmt, b
        INVOKE printf, ADDR msg1fmt, k
        INVOKE printf, ADDR msg1fmt, d
main    endp
        end