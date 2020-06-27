; -----------------------------------------------------------------------
; Verilen pozitif bir tam sayının karekökünü hesaplamak için sayıdan  
; sırası ile 1,3,5.. gibi tek sayılar çıkartılarak sonuç sıfırdan küçük
; çıkana kadar işleme devam edilir. Gerçekleştirilen işlem sayısı verilen 
; sayının karekök değerini (tam sayı olarak) verir. 
; Bu program yığın üzerinden 1 word olarak aldığı parametrenin karekök
; değerini AX yazmacı üzerinden döndürür. Yığındaki parametreyi kaldırır.
; -----------------------------------------------------------------------
			PUBLIC SQROOT 		; Farklı programların kullanmasına izin ver
MYCODE		SEGMENT PARA 'CODE'
			ASSUME CS:MYCODE
SQROOT 		PROC FAR
			PUSH DX	
			PUSH BX
			PUSH BP
			MOV BP, SP			; yığın üzerinden yollanan parametreye BP ile eriş
			MOV DX, 1			; Çıkarılacak tek sayılar DX‘de olacak 
			XOR AX, AX			; kaç tane çıkarma işlemi yapıldığı AX’de tutulacak
			MOV BX, [BP+10]		; parametreyi BX yazmacına alıyoruz 
			SUB BX, DX
L1:			JL SON				; çıkarma işleminin sonucu negatif ise bitir
			INC AX				; İşlem sayısı için AX’i arttır 
			ADD DX, 2			; Bir sonraki tek sayısı hesapla 
			SUB BX, DX			; çıkarma işlemini yap 
			JMP L1				; kontrol etmek için Dallan 
SON:		POP BP				; Yığında saklananları ters sırada geri al 
			POP BX
			POP DX
			RET 2				; yığındaki parametreyi al ve bitir. 
SQROOT		ENDP
MYCODE		ENDS
			END					; kendi başına çalışması beklenen bir program 
								; olmadığı için Başlama noktası yok
