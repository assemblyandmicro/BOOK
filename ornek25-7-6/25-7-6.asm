; --------------------------------------------------------------------------
; Tüm öğrenciler dersten başarılı, başarısız veya bütünleme olarak 
; gruplanabileceğinden bu değişkenlerin tipleri word olarak tanımlanmıştır.
; --------------------------------------------------------------------------
MYDS		SEGMENT PARA 'DATA'
DIZI		DB 28, 12, 63, 99, 45, 10, 4, 78, 86, 54, 42, 17, 56, 69
N			DW 14
BASARISIZ 	DW 0
BASARILI 	DW 0
BUT			DW 0
TOPNOT		DW 0
ESIK		DB 40
MYDS		ENDS
MYSS		SEGMENT PARA STACK 'STACK'
			DW 20 DUP(?)
MYSS		ENDS
MYCS		SEGMENT PARA 'CODE'
			ASSUME DS:MYDS, SS:MYSS, CS:MYCS
CAN			PROC FAR
			PUSH DS
			XOR AX, AX
			PUSH AX
			MOV AX, MYDS
			MOV DS, AX
			XOR SI, SI
			MOV CX, N
L1:			MOV AL, DIZI[SI]
			CMP AL, ESIK
			JAE ESIKUSTU
			INC BASARISIZ
			JMP D1
ESIKUSTU:	CBW
			ADD TOPNOT, AX
D1:			INC SI
			LOOP L1
			MOV CX, N
			SUB CX, BASARISIZ
			XOR DX, DX
			MOV AX, TOPNOT
			DIV CX
			XOR SI, SI
			MOV CX, N
L2:			MOV AH, DIZI[SI]
			CMP AL, AH
			JBE GECTI
			CMP AH, ESIK
			JB KALDI
			INC BUT
			JMP KALDI
GECTI:		INC BASARILI
KALDI:		INC SI
			LOOP L2
			RETF
CAN			ENDP
MYCS		ENDS
			END CAN