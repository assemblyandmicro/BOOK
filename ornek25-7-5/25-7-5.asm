; --------------------------------------------------------------------------
; Program içerisinde kullanılan yazmaçların karşılık geldiği değişkenler     
; akış diyagramında gösterilmiştir.
; --------------------------------------------------------------------------
MYDS		SEGMENT PARA 'VERI'
DIZI		DB 1, 2, 3, 4, 5
N			DW 5
S			DB ?
MYDS		ENDS
MYSS		SEGMENT PARA STACK 'YIGIN'
			DW 20 DUP(?)
MYSS		ENDS
MYCS		SEGMENT PARA 'KOD'
			ASSUME DS:MYDS, SS:MYSS, CS:MYCS
ANA			PROC FAR
			PUSH DS
			XOR AX, AX
			PUSH AX
			MOV AX, MYDS
			MOV DS, AX
			MOV BX, 0
			XOR SI, SI
			MOV CX, N
			DEC CX
DON:		CMP BX, 0
			JNE SON_IF
			CMP SI, CX
			JGE SON_IF
			MOV AL, DIZI[SI]
			CMP AL, DIZI[SI+1]
			JLE ARTIR
			MOV BX, 1
ARTIR:		INC SI
			JMP DON
SON_IF:		CMP BX, 0
			JNE SIRASIZ
			MOV S, 1
			JMP SON
SIRASIZ:	MOV S, 0
SON:		RETF
ANA			ENDP
MYCS		ENDS
			END ANA
