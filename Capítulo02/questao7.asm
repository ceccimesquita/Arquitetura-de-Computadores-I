;
;   Building Instructions:
;   ml /Cx /coff questao7.asm /link /SUBSYSTEM:console /out:questao7.exe kernel32.lib legacy_stdio_definitions.lib msvcrt.lib
; Correção: 0,5

          .686
          .model flat, c
          .stack 100h
printf    PROTO arg1:Ptr Byte, printlist:VARARG
scanf     PROTO arg2:Ptr Byte, printlist:VARARG
          .data
in1fmt    byte "%d", 0
msg1fmt   byte 0Ah,"%s%", 0
msg2fmt   byte "%s", 0
msg21fmt  byte "%s", 0Ah, "%s", 0
msg3fmt   byte 0Ah, "%d%s%d%s%d", 0Ah, 0
msg4fmt   byte 0Ah, "%d%s%d%s%d", 0Ah, 0Ah, 0
msg1      byte "Enter a number: ",0
msg2      byte "Enter a larger number: ",0
msg3      byte "Enter an even larger", 0
msg31     byte "number: ",0
msg4      byte "  <  ",0
msg5      byte "  >  ",0
num1      sdword ?
num2      sdword ?
num3      sdword ?
          .code
main      proc
          INVOKE printf, ADDR msg1fmt, ADDR msg1
          INVOKE scanf, ADDR in1fmt, ADDR num1

          INVOKE printf, ADDR msg2fmt, ADDR msg2
          INVOKE scanf, ADDR in1fmt, ADDR num2

          INVOKE printf, ADDR msg21fmt, ADDR msg3, ADDR msg31
          INVOKE scanf, ADDR in1fmt, ADDR num3

          INVOKE printf, ADDR msg3fmt, num1, ADDR msg4, num2, ADDR msg4, num3
          INVOKE printf, ADDR msg4fmt, num1, ADDR msg5, num2, ADDR msg5, num3

          ret
main      endp
          end