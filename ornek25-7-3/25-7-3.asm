; --------------------------------------------------------------------------
; İlk dizide doğum tarihi, ikinci dizide ise yaş bilgisi tutulduğundan; ilki
; word tanımlı olmalıyken, ikincisi byte tanımlı olabilmektedir.
; --------------------------------------------------------------------------
ALLSG 		SEGMENT PARA 'CODE'
			ORG 100H
			ASSUME CS:ALLSG, DS:ALLSG, SS:ALLSG
ATLA:		JMP ARRAYS
A1			DW 5
D1			DW 1989, 2002, 1996, 2003, 1971
B1			DW 7
D2			DB 21, 63, 42, 29, 54, 35, 32
D3 			DW 12 DUP(?)
ARRAYS		PROC NEAR
			LEA DI, D1
			LEA SI, D2
			XOR BX, BX
			MOV CX, A1
L1:			MOV AX, [DI]
			MOV D3[BX], AX
			ADD DI, 2
			ADD BX, 2
			LOOP L1
			MOV CX, B1
L2:			MOV AL, [SI]
			CBW
			MOV D3[BX], AX
			ADD BX, 2
			INC SI
			LOOP L2
			RET
ARRAYS		ENDP
ALLSG		ENDS
			END ATLA
