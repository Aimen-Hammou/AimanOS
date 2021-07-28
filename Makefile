ASM = nasm
ASM-FILES = bootloader.asm bootloaderPrint.asm bootloaderPrintHEX.asm
ASM-FLAGS = -f bin
ASM-OUTPUT-FLAG = -o

boot : BIN
	qemu-system-x86_64 bootloader.bin -boot c


BIN: 
	$(ASM) $(ASM-FLAGS) bootloader.asm $(ASM-OUTPUT-FLAG) bootloader.bin
