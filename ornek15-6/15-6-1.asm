.586
.model flat, c
.stack 100h
.data
.code
SelSortASM 	PROC NEAR
			PUSH EBP
			PUSH ECX
			PUSH EDI
			PUSH ESI
			PUSH EAX
			PUSH EBX
			PUSH EDX
			MOV EBP, ESP
			MOV EDI, [EBP+32]
			MOV ECX, [EBP+36]
			DEC ECX
			MOV EAX, EDI
dis_don:	MOV EBX, ECX
			MOV ESI, EAX
			MOV EDI, EAX
			MOV EDX, [EDI]
ic_don:		ADD ESI, 4
			CMP [ESI], EDX
			JGE ATLA
			MOV EDI, ESI
			MOV EDX, [EDI]
			MOV EDX, [EDI]
ATLA:		DEC EBX
			JNZ ic_don
			MOV EDX, [ESI]
			XCHG EDX, [EDI]
			MOV [ESI], EDX
			LOOP dis_don
			POP EDX
			POP EBX
			POP EAX
			POP ESI
			POP EDI
			POP ECX
			POP EBP
			RET
SelSortASM	ENDP
			END