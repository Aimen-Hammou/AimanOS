[ org 0x7c00 ]

	MOV BP, 0x8000
	MOV SP, BP

	MOV BX, 0X9000
	MOV DH, 2

	CALL DISK_LOAD


	MOV DX, [ 0x9000 ]
	CALL PRINT_HEX


	CALL PRINT_NEW_LINE

	MOV DX, [ 0x9000 + 512 ]
	CALL PRINT_HEX

	JMP $


%include "BootloaderPrint.asm"
%include "bootloaderPrintHEX.asm"
%include "boot_sect_disk.asm"	

times 510 - ($-$$) db 0
dw 0xaa55

; boot sector = sector 1 of cyl 0 of head 0 of hdd 0
; from now on = sector 2 ...
times 256 dw 0xdada ; sector 2 = 512 bytes
times 256 dw 0xface ; sector 3 = 512 bytes