processor 16f877
include <p16f877.inc>

valor1 equ h'21'
valor2 equ h'22'
valor3 equ h'23'
cte1 equ 20h
cte2 equ 50h
cte3 equ 60h

ORG 0
GOTO INICIO
ORG 5

INICIO:	BSF STATUS,RP0
		BCF STATUS,RP1
		MOVLW H'0'
		MOVWF TRISB
		BCF STATUS,RP0
		CLRF PORTB
loop2:
	 	MOVLW H'80'
		BCF STATUS,0
	 	MOVWF PORTB
ciclo:
		CALL retardo
		RRF PORTB,F
		BTFSS STATUS,0 ;SKIP si CARRY = 1
		GOTO ciclo
		GOTO loop2
retardo:
		MOVLW cte1
		MOVWF valor1
tres:
	 	MOVLW cte2
		MOVWF valor2
dos:
	 	MOVLW cte3
		MOVWF valor3
uno:
	 	DECFSZ valor3
		GOTO uno
		DECFSZ valor2
		GOTO dos
		DECFSZ valor1
		GOTO tres
		RETURN
		END