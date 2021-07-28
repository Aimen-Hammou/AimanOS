; DX = where is stored the data
; CX = loop index	

 PRINT_HEX:
	PUSHA

	MOV CX, 0;

LOOP_HEX:
	
	CMP CX, 4 ;loop 4 times
	JE DONE_HEX


	MOV AX, DX
	AND AX, 0x000F ;get the last character
	ADD AL, 0x30 
	CMP AL, 0x39
	JLE STEP2
	ADD AL, 7 


STEP2:

	MOV BX, HEX_OUTPUT + 5
	SUB BX, CX
	MOV [ BX ], AL 
	ROR DX, 4


	ADD CX, 1
	JMP LOOP_HEX


DONE_HEX:

	MOV BX, HEX_OUTPUT
	CALL PRINT

	POPA

	RET 



HEX_OUTPUT:
	DB '0x0000', 0


	