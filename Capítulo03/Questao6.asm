;
;   Building Instructions:
;   ml /Cx /coff Questao6.asm /link /SUBSYSTEM:console /out:Questao6.exe kernel32.lib legacy_stdio_definitions.lib msvcrt.lib
; Correção: 0,5

          .686
          .model flat, c
          .stack 100h
printf    PROTO arg1:Ptr Byte, printlist:VARARG
scanf     PROTO arg2:Ptr Byte, printlist:VARARG
          .data
in1fmt    byte "%d", 0
msgbl     byte 0Ah, 0
msg1fmt   byte "%s", 0
msg2fmt   byte "%s%d", 0Ah, 0
msg1      byte "Enter the number of amperes: ", 0
msg2      byte "Enter the number of ohms: ", 0
msg3      byte "The number of volts is: ", 0
msg4      byte "The number of watts is: ", 0
ampares   sdword ?
ohms      sdword ?
volts     sdword ?
watts     sdword ?
          .code
main      proc
          INVOKE  printf, ADDR msg1fmt, ADDR msgbl
          INVOKE  printf, ADDR msg1fmt, ADDR msg1
          INVOKE  scanf, ADDR in1fmt, ADDR ampares
          INVOKE  printf, ADDR msg1fmt, ADDR msg2
          INVOKE  scanf, ADDR in1fmt, ADDR ohms
          INVOKE  printf, ADDR msg1fmt, ADDR msgbl
          mov     eax, ampares
          imul    ohms
          mov     volts, eax
          imul    ampares
          mov     watts, eax
          INVOKE  printf, ADDR msg2fmt, ADDR msg3, volts
          INVOKE  printf, ADDR msg2fmt, ADDR msg4, watts
          ret
main      endp
          end