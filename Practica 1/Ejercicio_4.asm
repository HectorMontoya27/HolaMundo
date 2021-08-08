processor 16f877        ;Procesador a utilizar
include<p16f877.inc> ;Incluir libreria

    org 0
    goto INICIO
    org 5
 
INICIO:
    movlw h'1'    	;Guardamos en W el valor de 1
    movwf h'20'  	;Guardamos en espacio h'20' el valor de W
CICLO:  
    rlf h'20',1        	;Hacemos un recorrimiento de bit a la izquierda
    btfss h'20',7		;Validamos el bit de la posicion 7, Si es 1 salta
    goto CICLO    	;No salto, vamos a CICLO
    goto INICIO   	;Si salto, vamos a INICIO
    end
