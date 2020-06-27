; --------------------------------------------------------------------------
; SWAP işlemi için XCHG komutu kullanılmıştır.
; --------------------------------------------------------------------------
CODESG 		SEGMENT PARA 'KOD'
			ORG 100H
			ASSUME CS:CODESG, DS:CODESG, SS:CODESG
BASLA:		JMP EBOB
SONUC		DW ?
A 			DW 28
B			DW 32
EBOB		PROC NEAR
			MOV AX, A
			MOV BX, B
			CMP AX, BX
			JAE L1
			XCHG AX, BX
L1:			MOV DX, 0
			DIV BX
			CMP DX, 0
			JE L2
			MOV AX, BX
			MOV BX, DX
			JMP L1
L2:			MOV SONUC, BX
			RET
EBOB		ENDP
CODESG		ENDS
			END BASLA
