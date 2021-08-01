ASM = nasm
ASM-FILES = bootloader.asm
ASM-FLAGS = -f bin
ASM-OUTPUT-FLAG = -o

boot: 
	make bin
	qemu-system-x86_64 bootloader.bin -boot c

bin: bootloader.asm
	nasm -f bin bootloader.asm -o bootloader.bin


clean:
	rm -rf *.bin