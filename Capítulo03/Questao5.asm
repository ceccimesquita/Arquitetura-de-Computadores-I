;
;   Building Instructions:
;   ml /Cx /coff Questao5.asm /link /SUBSYSTEM:console /out:Questao5.exe kernel32.lib legacy_stdio_definitions.lib msvcrt.lib
; Correção: 0,5

          .686
          .model flat, c
          .stack 100h
printf    PROTO arg1:Ptr Byte, printlist:VARARG
scanf     PROTO arg2:Ptr Byte, printlist:VARARG
          .data
in1fmt    byte "%d", 0
msg1fmt   byte 0Ah,"%s", 0
msg2fmt   byte 0Ah,"%s%d", 0Ah, 0Ah, 0
msg1      byte "Enter an integer: ", 0
msg2      byte "The integer is: ", 0
number    sdword ?
          .code
main      proc
          INVOKE  printf, ADDR msg1fmt, ADDR msg1
          INVOKE  scanf, ADDR in1fmt, ADDR number
          mov  eax, 3
          imul number
          neg eax
          add eax, 7
          mov number, eax
          INVOKE  printf, ADDR msg2fmt, ADDR msg2, number
          ret
main      endp
          end