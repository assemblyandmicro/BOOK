; --------------------------------------------------------------------------
; COM tipi programda veri kesiminin kod kesiminden önce yerleştirildiği ve   
; JMP kodu ile ana yordama atlandığı sintaks kullanılmıştır.
; --------------------------------------------------------------------------
CODESG		SEGMENT PARA 'KOD'
			ORG 100H
			ASSUME DS:CODESG, SS:CODESG, CS:CODESG
BASLA:		JMP SICAKLIK
N			DW 12
DIZI 		DB -5, 0, 12, 23, 26, 30, 31, 34, 33, 20, 10, -23
ESIK		DB -20
SONUC		DB ?
SICAKLIK	PROC NEAR
			XOR SI, SI
			MOV CX, N
			MOV AL, ESIK
DON:		CMP SI, CX
			JAE YALNIS
			CMP AL, DIZI[SI]
			JG DOGRU
			INC SI
			JMP DON
YALNIS:		MOV SONUC, 0
			JMP SON
DOGRU:		MOV SONUC, 1
SON:		RET
SICAKLIK	ENDP
CODESG		ENDS
			END BASLA
