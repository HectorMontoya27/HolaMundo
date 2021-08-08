  processor 16f877     ;Procesador a utilizar
  include<p16f877.inc> ;Libreria
 
  org 0
  goto INICIO
  org 5
  
INICIO           
       movlw h'0'     	;Guardamos en W el 0
	   movwf h'20'		;Guardamos en la localidad 20 lo que hay en W
SUMA
       incf h'20',1    	;Incrementa el valor que haya en 20h
       movlw h'9'     	;Carga en W el valor de 9h
       xorwf h'20',w	;Hacemos XOR de W con la localidad 20
       btfsc STATUS,Z	;Validamos las banderas, si Z es 0 salta
	   goto SIETE		;Vamos a la etiqueta SIETE
	   movlw h'19'     	;Carga en W el valor de 19h
	   xorwf h'20',w	;Hacemos XOR de W con la localidad 20
	   btfsc STATUS,Z	;Validamos las banderas, si Z es 0 salta
	   goto SIETE		;Vamos a la etiqueta SIETE
	   goto SUMA		;Vamos a la etiqueta SUMA
SIETE
	   movlw h'7'     	;Carga en W el valor de 7h
	   addwf h'20'		;Sumamos w y la localidad 20h
	   movlw h'20'		;Carga en W el valor de 20h
	   xorwf h'20',w	;Hacemos XOR de W con la localidad 20
	   btfsc STATUS,Z	;Validamos las banderas, si Z es 0 salta
	   goto INICIO		;Vamos a la etiqueta INICIO
	   goto SUMA		;Vamos a la etiqueta SUMA
end
