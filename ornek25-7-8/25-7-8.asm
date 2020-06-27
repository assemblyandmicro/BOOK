; --------------------------------------------------------------------------
; Elemanlar işaretli olabileceği için karşılaştırma işlemleri uygun kodlarla ; gerçekleştirilmiştir.
; --------------------------------------------------------------------------
MY_SS		SEGMENT PARA STACK 'STACK'
			DW 20 DUP(?)
MY_SS		ENDS
MY_DS		SEGMENT PARA 'DATA'
N1			DW 7
N2			DW 6
D1			DB 7, 12, 64, 98, 104, 105, 125
D2			DB -70, -10, 9, 17, 68, 90
DSON		DB 13 DUP(?)
MY_DS		ENDS
MY_CS		SEGMENT PARA 'CODE'
			ASSUME DS:MY_DS, SS:MY_SS, CS:MY_CS
MAIN		PROC FAR
			PUSH DS
			XOR AX, AX
			PUSH AX
			MOV AX, MY_DS
			MOV DS, AX
			XOR BX, BX
			XOR SI, SI
			XOR DI, DI
DON:		CMP SI, N1
			JAE ATLA
			CMP DI, N2
			JAE ATLA
			MOV AL, D1[SI]
			MOV AH, D2[DI]
			CMP AL, AH
			JL JD1
			MOV DSON[BX], AH
			INC DI
			JMP ORTAK
JD1:		MOV DSON[BX], AL
			INC SI
ORTAK:		INC BX
			JMP DON
ATLA:		CMP DI, N2
			JE LD1
			MOV CX, N2
			SUB CX, DI
L1:			MOV AL, D2[DI]
			MOV DSON[BX], AL
			INC BX
			INC DI
			LOOP L1
			JMP SON
LD1:		MOV CX, N1
			SUB CX, SI
L2:			MOV AL, D1[SI]
			MOV DSON[BX], AL
			INC BX
			INC SI
			LOOP L2
SON:		RETF
MAIN		ENDP
MY_CS		ENDS
			END MAIN