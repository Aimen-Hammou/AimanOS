GDT_START: ;entry point della GDT


GDT_NULL: ; NUll pointer per evitare possibili errori
	; 0x00

	dd 0x0
	dd 0x0

GDT_CODE: ; code segment descriptor
	
	DW 0xFFFF ; limite ( bits 0-15)
	DW 0x0 ; BASE ( BITS 0-16)
	DB 0x0 ; BASE ( BITS 16-23 )
	DB 10011010b ; prime flag
	DB 11001111b ; seconde flag
	DB 0x0 ; BASE ( BITS 24-31)

GDT_CODE: ; data segment descriptor
	
	DW 0xFFFF ; limite ( bits 0-15)
	DW 0x0 ; BASE ( BITS 0-16)
	DB 0x0 ; BASE ( BITS 16-23 )
	DB 10010010b ; prime flag
	DB 11001111b ; seconde flag
	DB 0x0 ; BASE ( BITS 24-31)

GDT_END: ; utile per calcolare la grandezza della GDT ( vedi sotto )


;GDT DESCRIPTOR
GDT_DESCRIPTOR:
	DW GDT_END - GDT_START - 1 ; ATTENZIONE al meno 1
	DD GDT_START


CODE_SEG equ GDT_CODE - GDT_START
DATA_SEG equ GDT_DATA - GDT_START