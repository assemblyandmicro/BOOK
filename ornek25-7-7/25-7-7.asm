; --------------------------------------------------------------------------
; Toplam işlemi double word büyüklüğüne taşabileceğinden gerekli kontroller 
; yapılmıştır.
; --------------------------------------------------------------------------
MY_SS		SEGMENT PARA STACK 'STACK'
			DW 20 DUP(?)
MY_SS		ENDS
MY_DS		SEGMENT PARA 'DATA'
DIZI		DW 7FFFH, 7AB2H, 70ABH, 7111H, 71FAH, 7232H, 7AF8H, 78C6H, 753DH, 70E0H
N			DW 10
TEK_TOP		DD 0
CIFT_TOP	DD 0
TEK_SAY		DW 0
CIFT_SAY	DW 0
TEK_ORT		DW ?
CIFT_ORT	DW ?
MY_DS		ENDS
MY_CS		SEGMENT PARA 'CODE'
			ASSUME DS:MY_DS, SS:MY_SS, CS:MY_CS
ANA			PROC FAR
			PUSH DS
			XOR AX, AX
			PUSH AX
			MOV AX, MY_DS
			MOV DS, AX
			MOV CX, N
			LEA SI, DIZI
DON:		MOV AX, [SI]
			TEST AX, 0001H
			JZ C_LABEL
			ADD WORD PTR [TEK_TOP], AX
			ADC WORD PTR [TEK_TOP+2], 0
			INC TEK_SAY
			JMP ARTIR
C_LABEL:	ADD WORD PTR [CIFT_TOP], AX
			ADC WORD PTR [CIFT_TOP+2], 0
			INC CIFT_SAY
ARTIR:		ADD SI, 2
			LOOP DON
			MOV DX, WORD PTR [CIFT_TOP+2]
			MOV AX, WORD PTR [CIFT_TOP]
			DIV CIFT_SAY
			MOV CIFT_ORT, AX
			MOV DX, WORD PTR [TEK_TOP+2]
			MOV AX, WORD PTR [TEK_TOP]
			DIV TEK_SAY
			MOV TEK_ORT, AX
			RETF
ANA			ENDP
MY_CS		ENDS
			END ANA