;   Correção: 0,5. Não monta.
;   Building Instructions:
;   ml /c /Fl"questao7.lst" /Cx /coff questao7.asm /link /SUBSYSTEM:console  /out:questao7.exe kernel32.lib legacy_stdio_definitions.lib msvcrt.lib
;
          .686
          .model  flat, c
          .stack  100h
printf    PROTO   arg1:Ptr Byte, printlist:VARARG
scanf     PROTO   arg2:Ptr Byte, inputlist:VARARG
          .data
in1fmt    byte   "%d", 0

msg1fmt   byte   0Ah, "%s%d", 0Ah, 0Ah, 0
msg2fmt   byte    "%s", 0Ah, 0
msg1      byte   "The contents of the accumulator are: ", 0
msg2      byte   "Enter a number:  ", 0
temp      sdword ?
three     sdword 3
          .code
LOADACC   macro operand
          mov eax, operand   ;; load eax with the operand
          endm
ADDACC    macro operand
          add eax, operand   ;; add the operand to eax 
          endm
MULTACC   macro operand
	      push ebx           ;; save ebx and ecx
          push ecx
          mov ebx, eax       ;; mov eax to ebx
          mov eax, 0         ;; clear accumulator to zero
          mov ecx, operand   ;; load ecx with operand
          if operand LT 0    ;; if operand is negative
          neg ecx            ;; make ecx positive for loop
          endif   
          .while ecx > 0
          add eax, ebx       ;; repetitively add 
          dec ecx            ;; decrement ecx
          .endw    
          if operand LT 0    ;; if operand is negative
          neg eax            ;; negate accumulator, eax
          endif
          pop ecx            ;; restore ecx and ebx
          pop ebx 
          endm
INACC     proc 
          push eax
          push ecx
          push edx
          INVOKE printf, ADDR msg2fmt, ADDR msg2
          INVOKE scanf, ADDR in1fmt, ADDR temp
          mov eax, temp
          pop edx
          pop ecx
          pop eax
          ret
INACC     endp
STOREACC  macro operand
          mov operand, eax   ;; store eax to operand
          endm
SUBACC    macro operand
          sub eax, operand   
          endm
DIVACC    macro operand
               if operand EQ 0    
                    ret -1
               else 
                    push edx
                    push ebx
                    mov temp, 0
                    if eax LT 0
                    mov temp, eax
                    neg neg eax
                    endif
                    mov edx,eax
                    mov eax, 0
                    if operand LT 0    
                    neg operand       
                    endif
                    .while( edx >= operand)
                    sub edx, operand
                    inc eax
                    .endw
                    if operand LT 0    
                    neg eax 
                    endif 
                    if temp LT 0
                    neg eax
                    endif
                    pop ebx
                    pop edx
               endif
          endm
OUTACC    proc
	      push eax           ;; save ebx and ecx, and edx
          push ecx
          push edx
          mov temp, eax
          INVOKE printf, ADDR msg1fmt, ADDR msg1, temp
	      pop edx            ;; save ebx and ecx, and edx
          pop ecx
          pop eax
          ret       
OUTACC    endp
main      proc 
          mov EAX, 20
          SUBACC 3
          CALL    OUTACC
          CALL    INACC
          CALL   OUTACC
          STOREACC three
          CALL    OUTACC
          DIVACC 2
          CALL    OUTACC
          ret
main      endp
          end          