; DL = disk we want to read
; DH = head of the disk
; AH = 0x02 because we want to read the disk ( INT 13H )
; AL = Sector we are reading
; CL = indicates the first available sector 
; CH = indicates the cylinder

; [ES : BX ] = DATA BUFFER
; MBR = HDD 0, CY = 0, HEAD = 0, SECTOR = 0

DISK_LOAD:
	PUSHA

	PUSH DX

	MOV AH, 0x02 ; 0x02 = read
	MOV AL, DH; AL = sector we are reading
	MOV CL, 0x02 ; 0x01 = bootloader, 0x02 first available sector
	MOV CH, 0x00 ; 0x00 ( first cylinder )

	MOV DH, 0x00
	
	INT 0x13
	JC DISK_ERROR


	POP DX
	CMP AL, DH
	JNE SECTOR_ERROR

	POPA
	RET



DISK_ERROR:

	MOV BX, DISK_ERROR_MSG
	CALL PRINT
	CALL PRINT_NEW_LINE

	MOV DH, AH ; AH = contains the error code

	CALL PRINT_HEX

	JMP $ ; HALT


SECTOR_ERROR:
	MOV BX, SECTOR_ERROR_MSG
	CALL PRINT


DISK_ERROR_MSG: db "Error while reading", 0
SECTOR_ERROR_MSG: db "Incorrect Sector", 0