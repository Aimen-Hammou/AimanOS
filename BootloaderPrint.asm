PRINT: 
	PUSHA 


; while ( String[i] != 0) i++

START:
	MOV AL, [ BX ] ; BASE ADDRESS OF THE STRING
	CMP AL, 0 
	JE  DONE ; String[i] != 0

	MOV AH, 0x0e
	INT 0x10

	ADD BX, 1 ; i++;

	JMP START ; WHILE


DONE:
	POPA
	RET


PRINT_NEW_LINE:
	PUSHA


	MOV AH, 0x0e

	MOV AL, 0x0a ; nuova linea	
	INT 0x10

	MOV AL, 0x0d
	INT 0x10

	POPA

	RET