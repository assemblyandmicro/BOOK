; --------------------------------------------------------------------------
; ALAN_BUL harici yordamında sadece kod kesimi tanımlanmıştır.
; --------------------------------------------------------------------------
			PUBLIC ALAN_BUL
MYCODE		SEGMENT PARA 'KOD'
			ASSUME CS:MYCODE
ALAN_BUL	PROC FAR
; --------------------------------------------------------------------------
; İşlem sırasında kullanacağımız yazmaçların daha önce sahip olduğu 
; değerleri kayıp etmemesi için yığında saklamalıyız. Benzer şekilde yığın
; kullanarak parametre aktaracağımız için BP’in de saklanması gerekir. 
; --------------------------------------------------------------------------
			PUSH BX
			PUSH CX
			PUSH DI
			PUSH BP
			MOV BP, SP
			XOR AX, AX
			ADD AX, [BP+12]
			ADD AX, [BP+14]
			ADD AX, [BP+16]
			SHR AX, 1
			MOV BX, AX
			SUB BX, [BP+12]
			MOV CX, AX
			SUB CX, [BP+14]
			MOV DI, AX
			SUB DI, [BP+16]
			MUL BX
			MUL CX
			MUL DI
			POP BP
			POP DI
			POP CX
			POP BX
			RETF 6
ALAN_BUL	ENDP
MYCODE		ENDS
			END