;
;   Building Instructions:
;   ml /Cx /coff questao2.asm /link /SUBSYSTEM:console /out:questao2.exe kernel32.lib legacy_stdio_definitions.lib msvcrt.lib
;
        .686
        .model  flat, c
        .stack  100h
printf  PROTO   arg1:Ptr Byte, printlist:VARARG
scanf   PROTO   arg2:Ptr Byte, inputlist:VARARG
        .data
msg1fmt byte    "%d",0Ah,0 
ans     sdword 0
x       sdword 2
i       sdword 1
y       sdword 4
        .code
main    proc
mov ebx, i
if01:   cmp x,0
        je endif01
while01: cmp ebx, y
        jg endw01
        mov eax, ans
        add eax, x
        mov ans, eax
        inc i
        mov ebx, i
        jmp while01
endw01: nop
endif01:nop
        INVOKE printf, ADDR msg1fmt, ans
        INVOKE printf, ADDR msg1fmt, x
        INVOKE printf, ADDR msg1fmt, y
        INVOKE printf, ADDR msg1fmt, i
main    endp
        end