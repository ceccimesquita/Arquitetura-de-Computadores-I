;
;   Building Instructions:
;   ml /Cx /coff questao7.asm /link /SUBSYSTEM:console /out:questao7.exe kernel32.lib legacy_stdio_definitions.lib msvcrt.lib
;
        .686
        .model  flat, c
        .stack  100h
printf  PROTO   arg1:Ptr Byte, printlist:VARARG
scanf   PROTO   arg2:Ptr Byte, inputlist:VARARG
        .data
msg1fmt byte    "%d",0Ah,0 
sum     sdword ?
i       sdword ?
        .code
main    proc
        mov eax, 10
        mov sum, 0
repeat01: nop
        add sum, eax
        sub eax, 2
        cmp eax,0
        jg repeat01
endrpt01: nop
        mov i, eax
        INVOKE printf, ADDR msg1fmt, sun
        INVOKE printf, ADDR msg1fmt, i
main    endp
        end