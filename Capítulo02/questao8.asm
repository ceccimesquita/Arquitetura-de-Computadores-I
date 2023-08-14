;
;   Building Instructions:
;   ml /Cx /coff questao8.asm /link /SUBSYSTEM:console /out:questao8.exe kernel32.lib legacy_stdio_definitions.lib msvcrt.lib
; Correção: 0,5

          .686
          .model flat, c
          .stack 100h
printf    PROTO arg1:Ptr Byte, printlist:VARARG
scanf     PROTO arg2:Ptr Byte, printlist:VARARG
          .data
in1fmt    byte "%d", 0
msg1ftm   byte "%s", 0
msg2ftm   byte 0Ah, "%s", 0
msg3ftm   byte 0Ah, "%s%d", 0
msgbl     byte 0Ah, 0
msg1      byte "Enter a number: ", 0
msg2      byte "Numbers ", 0

msg3      byte "  ", 0

num1      sdword ?
num2      sdword ?

          .code
main      proc
          INVOKE  printf, ADDR msg1ftm, ADDR msgbl
          INVOKE  printf, ADDR msg1ftm, ADDR msg1
          INVOKE  scanf, ADDR in1fmt, ADDR num1
          INVOKE  printf, ADDR msg1ftm, ADDR msg1
          INVOKE  scanf, ADDR in1fmt, ADDR num2

          INVOKE  printf, ADDR msg2ftm, ADDR msg2
          INVOKE  printf, ADDR msg3ftm, ADDR msg3, num1
          INVOKE  printf, ADDR msg3ftm, ADDR msg3, num2
          INVOKE  printf, ADDR msg1ftm, ADDR msgbl

          ret
main      endp
          end


