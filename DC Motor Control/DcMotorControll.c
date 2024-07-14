void main() {
     short i = 0;
     TRISB = 0x00;
     TRISD = 0xFF;
     PORTB = 0x00;

     portb.f0 = 1;
     portb.f1 = 0;

     PWM1_Init(5000);
     PWM1_Start();
     PWM1_Set_Duty(i);
     
     while(1){
          if(portd.f0 == 1 && i<250){
                delay_ms(100);
                if(portd.f0 == 1 && i<250){
                       i = i+10;
                       PWM1_Set_Duty(i);
                }
          }
          if(portd.f1 == 1 && i>0){
                delay_ms(100);
                if(portd.f1 == 1 && i>0){
                       i = i-10;
                       PWM1_Set_Duty(i);
                }
          }

     }
}


/*
void main() {
     TRISB = 0x00;  // Output
     TRISD = 0xFF;  // Input
     PORTB = 0x00;
     
     while(1)
     {
     if(portd.f0 == 0)
     {
          delay_ms(100);
          if(portd.f0 == 0)
          {
              portb.f0 = 0;
              portb.f1 = 1;
          }
     }

    if(portd.f1 == 0)
     {
          delay_ms(100);
          if(portd.f1 == 0)
          {
              portb.f0 = 1;
              portb.f1 = 0;
          }
     }

   }
}

*/