; --------------------------------------------------------------------------
; MAIN yordam içerisinde SAY harici yordamı çağırılmıştır.
; --------------------------------------------------------------------------
			EXTRN SAY:FAR
MYSS		SEGMENT PARA STACK 'S'
			DW 20 DUP(?)
MYSS		ENDS
MYDS		SEGMENT PARA 'DATA'
DIZI		DW 12, 12, 12, 12, 12, 12, 13, 14, 15, 16, 17
N 			DW 11
ARANAN		DB 12
SONUC		DW ?
MYDS		ENDS
MYCS		SEGMENT PARA PUBLIC 'CODE'
			ASSUME CS:MYCS, DS:MYDS, SS:MYSS
MAIN		PROC FAR
			PUSH DS
			XOR AX, AX
			PUSH AX
			MOV AX, MYDS
			MOV DS, AX
			XOR AX, AX
			MOV AL, ARANAN
			PUSH AX
			LEA AX, DIZI
			PUSH AX
			PUSH N
			CALL SAY
			MOV SONUC, AX
			RETF
MAIN		ENDP
MYCS		ENDS
			END MAIN