; --------------------------------------------------------------------------
; ANA yordam kodu içerisinde harici yordam olarak ALAN_BUL kullanılmaktadır.
; --------------------------------------------------------------------------
			EXTRN ALAN_BUL:FAR
MYSS		SEGMENT PARA STACK 'S'
			DW 20 DUP(?)
MYSS		ENDS
MYDS		SEGMENT PARA 'D'
KEN			DW 6, 8, 5, 9, 4, 8, 2, 2, 3
N			DW 3
ENBYKALAN	DW 0
MYDS		ENDS
MYCS		SEGMENT PARA 'K'
			ASSUME CS:MYCS, DS:MYDS, SS:MYSS
ANA			PROC FAR
			PUSH DS
			XOR AX, AX
			PUSH AX
			MOV AX, MYDS
			MOV DS, AX
			MOV CX, N
			XOR SI, SI
L1:			PUSH KEN[SI]
			PUSH KEN[SI+2]
			PUSH KEN[SI+4]
			CALL ALAN_BUL
			CMP AX, ENBYKALAN
			JB KUCUK
			MOV ENBYKALAN, AX
KUCUK:		ADD SI, 6
			LOOP L1
			RETF
ANA			ENDP
MYCS		ENDS
			END ANA