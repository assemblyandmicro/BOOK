; -----------------------------------------------------------------------
; PROGRAM : Örnek 18 8.ASM
; 8255 kullanarak mod1 giriş ile tuş tarama takımını okuyup 
; mod 1 çıkış ile 7 parçalı göstere süren assembly program 
; -----------------------------------------------------------------------
			PAGE 60, 80
			TITLE 8255 mod1 giriş mod1 çıkış
CODE		SEGMENT PARA 'CODE'
			ASSUME CS:CODE
START 		PROC FAR			; ana yordam
			MOV DX, 206H
			MOV AL, 09H
			OUT DX, AL			; BSR mod bit set
			MOV AL, 05H
			OUT DX, AL			; BSR mod bit set
			MOV AL, 0BCH
			OUT DX, AL			; Mod 1 haberleşme
ENDLESS:	
L1:			MOV DX, 204H		; MM74C922 hazır olana kadar bekle
			IN AL, DX
			TEST AL, 08H
			JE L1
			MOV DX, 200H		; MM74C922’den veriyi oku
			IN AL, DX
			MOV BL, AL
L2:			MOV DX, 204H		; 4511 hazır olana kadar bekle
			IN AL, DX
			TEST AL, 01H
			JE L2
			MOV DX, 202H		; 4511’e veriyi yaz
			MOV AL,BL
			OUT DX, AL
			JMP ENDLESS			; sonsuz döngüde tekrarla 
START 		ENDP
CODE		ENDS
			END START