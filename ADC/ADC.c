int ADCvalue;
//Creating character array
char char_array[4];
void main() {
     UART1_Init(9600);
     ADC_Init();
     //Creating a loop to read ADC
     while(1)
     {
             ADCvalue = ADC_Read(0);
             inttostr(ADCvalue, char_array);
             UART1_Write_Text("Analog signal = ");
             UART1_Write_Text(char_array);
             strcpy(char_array,"");
             UART1_Write(13);
             delay_ms(1000);
     }
}