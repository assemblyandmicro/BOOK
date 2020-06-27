; --------------------------------------------------------------------------
; SAY harici yordamı içerisinde sayma işlemi gerçekleştirilmektedir.
; --------------------------------------------------------------------------
			PUBLIC SAY
MYCS		SEGMENT PARA PUBLIC 'CODE'
			ASSUME CS:MYCS
SAY			PROC FAR
			PUSH CX
			PUSH DI
			PUSH BP
			MOV BP, SP
			MOV CX, [BP+10]
			MOV DI, [BP+12]
			MOV BX, [BP+14]
			XOR AX, AX
L1:			CMP BX, [DI]
			JNE ATLA
			INC AX
ATLA:		ADD DI, 2
			LOOP L1
			POP BP
			POP DI
			POP CX
			RETF 6
SAY			ENDP
MYCS		ENDS
			END