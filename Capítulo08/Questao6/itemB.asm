; Correção: 0,5
;   Building Instructions:
;   ml /Cx /coff itemB.asm /link /SUBSYSTEM:console  /out:itemB.exe kernel32.lib legacy_stdio_definitions.lib msvcrt.lib
;   
          .686
          .model  flat, c
          .stack  100h
printf    PROTO   arg1:Ptr Byte, printlist:VARARG

          .data
msg1fmt   byte    "%s", 0Ah, 0
msg2fmt   byte    "%d ", 0

msg1      byte    "Array ordenado:", 0

n         sdword  7
array     sdword  1, 20, 3, 40, 5, 60, 7
temp      sdword  ?
controle  sdword  ?
          .code
main      proc
          mov ecx, n
          mov esi, offset array+0

          .repeat ; primeiro loop
          push ecx 
          push esi
          mov edi, esi
          add edi, 4

          mov controle, 1

          .if ecx > 1
          sub ecx, 1
          .endif
          
          .repeat ; segundo loop
          mov eax, [esi]
          .if eax > [edi]
          mov temp, eax
          mov eax, [edi]
          mov [esi], eax
          mov eax, temp
          mov [edi], eax
          mov controle, 0
          .endif
          add esi, 4
          add edi, 4
          .untilcxz

          .if controle == 1
          jmp fim
          .endif

          pop esi
          pop ecx 
          .untilcxz
fim:      nop
          INVOKE  printf, ADDR msg1fmt, ADDR msg1

          mov ecx, n
          mov ebx, 0

          .repeat
          push ecx
          INVOKE  printf, ADDR msg2fmt, array[ebx]
          add ebx, 4
          pop ecx
          .untilcxz

          ret
main      endp
          end