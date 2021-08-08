processor 16f877A
include <p16f877a.inc>

;Variables para el retraso.
valor1	equ	h'21'
valor2	equ	h'22'
valor3	equ	h'23'
cte1	equ	20h
cte2	equ	90h
cte3	equ	90h



		org 0h
		goto INICIO
		org 05h


INICIO:
		clrf	PORTA
		bsf		STATUS, RP0
		bcf 	STATUS, RP1
		movlw	h'0'
		movwf	TRISB
		clrf	PORTB

		movlw	06h
		movwf	ADCON1
		movlw	3fh
		movwf	TRISA
		bcf		STATUS, RP0
		
CICLO:
		movfw	PORTA
		xorlw	B'000000'
		btfsc	STATUS, Z
		goto	APG

		movfw	PORTA
		xorlw	B'000001'
		btfsc	STATUS, Z
		goto	UNOS

		movfw	PORTA
		xorlw	B'000010'
		btfsc	STATUS, Z
		goto	DER

		movfw	PORTA
		xorlw	B'000011'
		btfsc	STATUS, Z
		goto	IZQ

		movfw	PORTA
		xorlw	B'000100'
		btfsc	STATUS, Z
		goto	DERIZQ

		movfw	PORTA
		xorlw	B'000101'
		btfsc	STATUS, Z
		goto	ENCAPG


	

DERIZQ:
		movlw	h'80'
		movwf	PORTB
		call 	retardo

DER2:
		rrf		PORTB, 1
		call	retardo
		btfss	PORTB, 0
		goto	DER2
		movlw	h'01'
		movwf	PORTB
		call 	retardo

IZQ2:
		rlf		PORTB, 1
		call 	retardo
		btfss	PORTB, 7
		goto	IZQ2
		goto 	CICLO



ENCAPG:
		movlw	h'00'
		movwf	PORTB
		call 	retardo
		movlw	h'FF'
		movwf	PORTB
		call	retardo
		goto 	CICLO

APG:
		movlw	h'00'
		MOVWF	PORTB
		goto	CICLO
	
UNOS:
		movlw	h'ff'
		movwf	PORTB
		goto	CICLO

DER:
		movlw	h'80'
		movwf	PORTB
		call	retardo

DER1:
		rrf		PORTB, 1
		call	retardo
		btfss	PORTB, 0
		goto	DER1
		goto	CICLO

IZQ:
		movlw	h'01'
		movwf	PORTB
IZQ1:
		rlf		PORTB, 1
		call	retardo
		btfss	PORTB, 7
		goto IZQ1
		goto CICLO
		

retardo:
		movlw	cte1
		movwf	valor1
tres:
		movwf	cte2
		movwf	valor2
dos:
		movwf	cte3
		movwf	valor3
uno:
		decfsz	valor3
		goto	uno
		decfsz	valor2
		goto 	dos
		decfsz	valor1
		goto	tres


		return
		end