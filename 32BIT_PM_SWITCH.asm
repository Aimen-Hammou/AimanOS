[bits 16]

;STEP DA SEGUIRE:
; bloccare gli interrutori della BIOS ( inutili per la PM )
; caricare la GDT
; settare il registro della CPU CR0
; flushing del pipelining della CPU tramite un trucchetto
; inizializzare PM

SWITCH_TO_PM:
	
	cli ; IMPORTANTE: dobbiamo svuotare la IVT perchè
		; la IVT inziale settata dalla bios runna su 16BIT
		; che non è compatibile con la PM quindi porterebbe al crash

	lgdt [ GDT_DESCRIPTOR ]
	; cr0 non può essere settato direttamente
	MOV EAX, CR0
	OR EAX, 0x1
	MOV CR0, EAX

	; flushing pipelining
	JMP CODE_SEG: START_PM



[bits 32]

;STEPS: inizializzare i registri e preparare la stack

START_PM:
	
	MOV AX, DATA_SEG
	MOV DS, AX
	MOV SS, AX
	MOV ES, AX
	MOV FS, AX
	MOV GS, AX

	; Aggiorniamo la posizione della stack

	MOV EBP, 0x90000
	MOV ESP, EBP

	CALL BEGIN_PM