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
ans     sdword ?
x       sdword 2
i       sdword ?
y       sdword 4
        .code
main    proc
        mov ans,0
if01:   cmp y, 0
        je endif01
        mov i,1
        mov ebx,i
repeat01: nop
        mov eax, ans
        add eax, x
        mov ans, eax
        inc i
        mov ebx,i
        cmp ebx,y
        jle repeat01
endrpt01:nop
endif01: nop
        INVOKE printf, ADDR msg1fmt, ans
        INVOKE printf, ADDR msg1fmt, x
        INVOKE printf, ADDR msg1fmt, y
        INVOKE printf, ADDR msg1fmt, i


main    endp
        end