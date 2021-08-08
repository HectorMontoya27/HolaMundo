PROCESSOR 16F877A
INCLUDE <P16F877A.INC>

V1 EQU H'21'
V2 EQU H'22'
V3 EQU H'23'

C2 EQU .2
C3 EQU .82

TIEMPO EQU 0X20

ORG 0
GOTO INICIO
ORG 5

INICIO:
	CLRF PORTA ; Limpia los puertos A y B
	CLRF PORTB
	BSF STATUS,RP0
	BCF STATUS,RP1 ; Cambia al banco 1 de RAM
	MOVLW H'0'
	MOVWF TRISB
	CLRF PORTB
	MOVLW H'06'
	MOVWF ADCON1 ; Configura ADCON1
	MOVLW H'3F'
	MOVWF TRISA
	BCF STATUS, RP0 ; Regresa al banco 0 de RAM

CICLO:

	MOVFW PORTA
	XORLW B'000001' 
	BTFSC STATUS,Z
	GOTO CERO

	MOVFW PORTA
	XORLW B'000010'
	BTFSC STATUS,Z
	GOTO NUEVECERO

	MOVFW PORTA
	XORLW B'000100'
	BTFSC STATUS,Z
	GOTO CIEN80

CERO:
	MOVLW B'00000001'
	MOVWF PORTB
	MOVLW .5
	MOVWF TIEMPO
	CALL RETARDO
	CLRF PORTB
	MOVLW .19
	MOVWF TIEMPO
	CALL RETARDO
	GOTO CICLO

NUEVECERO:
	MOVLW B'00000001'
	MOVWF PORTB
	MOVLW .15
	MOVWF TIEMPO
	CALL RETARDO
	CLRF PORTB
	MOVLW .185
	MOVWF TIEMPO
	CALL RETARDO
	GOTO CICLO

CIEN80:
	MOVLW B'00000001'
	MOVWF PORTB
	MOVLW .20
	MOVWF TIEMPO
	CALL RETARDO
	CLRF PORTB
	MOVLW .180
	MOVWF TIEMPO
	CALL RETARDO
	GOTO CICLO

RETARDO:
	MOVF TIEMPO, W
	MOVWF V1
TRES:
	MOVLW C2
	MOVWF V2
DOS:
	MOVLW C3
	MOVWF V3
UNO:
	DECFSZ V3
	GOTO UNO
	DECFSZ V2
	GOTO DOS
	DECFSZ V1
	GOTO TRES
	RETURN

END