[bits 32] ; usiamo la protected mode

; Essendo che siamo in PM non usiamo più interrutori BIOS ma manipoliamo VGA memory ( Implementa La GDT )
; FORMULA PER ACCEDERE UN 80X25 GRID = 0xB8000 * ( ROW * 80 + COL)

VIDEO_MEMORY_START equ 0xb8000 ; VGA memory ha text mode per evitare possibili manipolazioni dei pixel
WHITE_ON_BLACK equ 0x0f

; PM = PROTECTED MODE
PRINT_STRING_PM:

	PUSHA
	MOV EDX, VIDEO_MEMORY_START


PRINT_STRNG_PM_LOOP:
	
	MOV AL, [ EBX ] ; in EBX si trova il carattere da stampare

	MOV AH, WHITE_ON_BLACK

	CMP AL, 0 ; 0 = fine della stringa
	JE PRINT_STRNG_PM_DONE

	MOV [ EDX ], AX

	ADD EBX, 1 ; Prendi prossimo carattere 
	ADD EDX, 2 ; 2 byte perchè uno contiene ascii l'altro gli attributi del colore

	JMP PRINT_STRNG_PM_LOOP


PRINT_STRNG_PM_DONE:
	
	POPA
	RET