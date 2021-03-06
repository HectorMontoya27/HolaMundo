#include <16f877.h>
#device adc=8 //en caso de emplear el conv. A/D indica resoluci?n de 8 bits
#fuses HS,NOPROTECT,
#use delay(clock=20000000)
#use rs232(baud=9600, xmit=PIN_C6, rcv=PIN_C7)
#org 0x1F00, 0x1FFF void loader16F877(void) {}

//Variables
int Entrada_A;

char Entrada_T;

#int_rda
recep_serie(){
   //c?digo de la rutina de interrupci?n
   Entrada_T = getchar();
   if (Entrada_T == 'w'){printf("Avanza\n\r"); output_b(0x55);}
   if (Entrada_T == 's'){printf("Rebersa\n\r"); output_b(0xaa);}
   if (Entrada_T == 'a'){printf("Izquierda\n\r"); output_b(0x44);}
   if (Entrada_T == 'd'){printf("Derecha\n\r"); output_b(0x11);}
   if (Entrada_T == 'x'){printf("Detener\n\r"); output_b(0x00);}
}

void main()
{
   enable_interrupts(INT_RDA); //Recepci?n de datos por el puerto serie as?ncrona
   enable_interrupts(GLOBAL); //Habilita interrupciones generales
   
    while(1){
         Entrada_A = input_a();
         #bit A_0 = Entrada_A.0
         if (A_0) {output_d(0xff);} else {output_d(0x00);}
    }
}
