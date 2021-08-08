#include <16f877.h>     //Incluye la librer�a del microcontrolador 
#fuses HS,NOPROTECT,    //Fusibles de programaci�n(f�sico), HS: frec.cristales
#org 0x1F00, 0x1FFF void loader16F877(void) {}  
#use delay(clock=20000000)//Frecuencia de Oscilaci�n 20Mhz
//M�todo que enciende y apaga  el bit 0 del puerto B
void main()  
{ 
   while(1) //Ciclo while infinito
   {  
      output_b(0x01);  //Enciende el bit 0 del puerto B 
      delay_ms(1000);  //Delay de 1s
      output_b(0x00);  //Apaga bits del puerto B
      delay_ms(1000);   //Delay de 1s
   }
}


