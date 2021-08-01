[ org 0x7c00 ]

	MOV BP, 0X9000 ; STACK
	MOV SP, BP

	MOV BX, MSG_REAL_MODE
	CALL PRINT

	CALL SWITCH_TO_PM

	JMP $ ; non verrà mai eseguito ma mettiamolo per correttezza


%include "BootloaderPrint.asm"
%include "32BIT_GDT.asm"
%include "32BIT_PRINT.asm"
%include "32BIT_PM_SWITCH.asm"



[bits 32]

BEGIN_PM:
	
	MOV EBX, MSG_PM_MODE
	CALL PRINT_STRING_PM ; non possiamo usare PRINT_STRING perchè usa BIOS interrupts

	JMP $

MSG_REAL_MODE db "Inizializzata la REAL MODE", 0
MSG_PM_CODE db "Caricamento PROTECTED MODE avvenuto con successo", 0

times 510 - ($-$$) db 0
dw 0xaa55