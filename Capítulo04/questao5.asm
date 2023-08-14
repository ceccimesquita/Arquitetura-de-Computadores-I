;
;   Building Instructions:
;   ml /Cx /coff questao5.asm /link /SUBSYSTEM:console /out:questao5.exe kernel32.lib legacy_stdio_definitions.lib msvcrt.lib
;   Correção: 0,3
        .686
        .model  flat, c
        .stack  100h
printf  PROTO   arg1:Ptr Byte, printlist:VARARG
scanf   PROTO   arg2:Ptr Byte, inputlist:VARARG
        .data
msg1fmt byte    "%d",0
number sdword  1 
count sdword  10
        .code
main    proc
switch01: cmp number,0
          je case11
          cmp number,1
          je case11
          cmp number,2
          je case12
          cmp number,3
          je case12
case11: add count,2
        jmp endswitch01
case12: sub count,2
endswitch01: nop
        INVOKE printf, ADDR msg1fmt, count
main endp
    end