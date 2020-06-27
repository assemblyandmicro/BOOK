; --------------------------------------------------------------------------
; JMP komutları ile atlanılan yerler akış diyagramında noktalı yuvarlaklarla 
; gösterilmektedir.
; --------------------------------------------------------------------------
; KULLANILAN DEĞİŞKENLERİN TANIMLANMASI 
; --------------------------------------------------------------------------
DATASG		SEGMENT PARA 'VERI'
A			DB 4
B			DB 5
C			DB 3
TIP			DB ?
DATASG		ENDS
STACKSG		SEGMENT PARA STACK 'YIGIN'
			DW 12 DUP(?)
STACKSG		ENDS
CODESG		SEGMENT PARA 'KOD'
			ASSUME DS:DATASG, SS:STACKSG, CS:CODESG
ANA			PROC FAR
			;---------------------------------------------------------------
			; Dönüş için gerekli olan değerler yığında saklanıyor
			;---------------------------------------------------------------
			PUSH DS
			XOR AX, AX
			PUSH AX
			;---------------------------------------------------------------
			; DATASG ismiyle tanımlı kesim alanına erişebilmek için gerekli tanımlar
			;---------------------------------------------------------------				
			MOV AX, DATASG
			MOV DS, AX
			MOV AL, A
			MOV BL, B
			MOV CL, C
			CMP AL, BL
			JE J1
			CMP BL, CL
			JE J2
			CMP AL, CL
			JE J2
			MOV TIP, 3
			JMP SON
J1:			CMP AL, CL
			JNE J2
			MOV TIP, 1
			JMP SON
J2:			MOV TIP, 2
SON:		RETF
ANA			ENDP
CODESG		ENDS
			END ANA
