;   Correção: 0,5
;   Building Instructions:
;   ml /Cx /coff questao5.asm /link /SUBSYSTEM:console /out:questao5.exe kernel32.lib legacy_stdio_definitions.lib msvcrt.lib
;

          .686
          .model  flat, c
          .stack  100h
printf    PROTO   arg1:Ptr Byte, printlist:VARARG
scanf     PROTO   arg2:Ptr Byte, inputlist:VARARG
          .data
msg1fmt   byte  "%s", 0
in1fmt    byte  "%x", 0
msg2fmt   byte  "%s%x", 0Ah, 0Ah, 0
msg1      byte  0Ah, "Enter a hexadecimal number: ", 0
msg2      byte  "The hexadecimal number is ", 0
msgb0  byte  "Fire alarm", 0Ah, 0    
msgb1   byte  "Carbon monoxide", 0Ah, 0    
msgb2 byte  "Power outage", 0Ah, 0    
msgb3   byte  "Gate unlocked", 0Ah, 0    
msgb4  byte  "Door open", 0Ah, 0  
msgb5   byte  "Window open", 0Ah, 0
dsb       dword ?
          .code 
main      proc 
          INVOKE printf, ADDR msg1fmt, ADDR msg1
          INVOKE scanf, ADDR in1fmt, ADDR dsb
          INVOKE printf, ADDR msg2fmt, ADDR msg2, dsb
          
          .while dsb <= 0ffh
          test dsb, 00000111b
          .if !ZERO?                ; if bit0, bit1 or bit2 = 1 then

          test dsb, 00000001b
          .if !ZERO?                ; if bit0 = 1 then
          INVOKE printf, ADDR msg1fmt, ADDR msgb0
          .endif

          test dsb, 00000010b
          .if !ZERO?                ; if bit1 = 1 then
          INVOKE printf, ADDR msg1fmt, ADDR msgb1
          .endif

          test dsb, 00000100b
          .if !ZERO?                ; if bit2 = 1 then
          INVOKE printf, ADDR msg1fmt, ADDR msgb2
          .endif

          .else

          test dsb, 00001000b
          .if !ZERO?                ; if bit3 = 1 then
          INVOKE printf, ADDR msg1fmt, ADDR msgb3
          .endif
  
          test dsb, 00010000b
          .if !ZERO?                ; if bit4 = 1 then
          INVOKE printf, ADDR msg1fmt, ADDR msgb4
          .endif

          test dsb, 00100000b
          .if !ZERO?                ; if bit5 = 1 then
          INVOKE printf, ADDR msg1fmt, ADDR msgb5
          .endif

          .endif

          INVOKE printf, ADDR msg1fmt, ADDR msg1
          INVOKE scanf, ADDR in1fmt, ADDR dsb
          INVOKE printf, ADDR msg2fmt, ADDR msg2, dsb

          .endw
          ret
main      endp
          end