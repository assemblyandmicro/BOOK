; --------------------------------------------------------------------------
; COM tipi programda veri kesiminin kod kesiminden sonra yerleştirildiği     
; sintaks kullanılmıştır.
; --------------------------------------------------------------------------
MYS			SEGMENT PARA 'KOD'
			ORG 100H
			ASSUME CS:MYS, DS:MYS, SS:MYS
KAYNAK_BUL	PROC NEAR
			XOR BX, BX
			MOV AL, K_ESIK
			MOV AH, B_ESIK
DON:		CMP KUYRUK[BX], AL
			JB SONRAKI
			CMP KUYRUK[BX], AH
			JBE BULUNDU
SONRAKI:	INC BX
			JMP DON
BULUNDU:	MOV INDIS, BL
SON:		RET
KAYNAK_BUL	ENDP
KUYRUK		DB 14, 11, 54, 62, 11, 3, 8, 63, 81, 5, 16
K_ESIK		DB 15
B_ESIK		DB 50
INDIS		DB ?
MYS			ENDS
			END KAYNAK_BUL
