; --------------------------------------------------------------------------
; Döngü işlemi CX yazmacı değeri kadar tekrarlanacağından çevrim başlamadan 
; CX yazmacı içerisine ilgili değer yazılmıştır.
; --------------------------------------------------------------------------
CSEG 		SEGMENT PARA 'KOD'
			ORG 100H
			ASSUME CS:CSEG, DS:CSEG, SS:CSEG
MAIN		PROC NEAR
			MOV CX, N
			MOV SI, X
			MOV BX, 1
			MOV AX, SI
			MOV DI, 1
			MOV DX, 0
L1:			PUSH AX
			DIV DI
			ADD BX, AX
			POP AX
			MUL SI
			INC DI
			LOOP L1
			MOV SONUC, BX
			RET
MAIN		ENDP
SONUC		DW ?
N 			DW 6
X			DW 5
CSEG		ENDS
			END MAIN
