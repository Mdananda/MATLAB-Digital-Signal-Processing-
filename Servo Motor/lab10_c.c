void rotation_0()
{
     unsigned int i;
     for(i=0;i<50;i++)
     {
           portb.f0 = 1;
           delay_us(800);
           portb.f0 = 0;
           delay_us(19200);
     }
}
void rotation_90()
{
     unsigned int i;
     for(i=0;i<50;i++)
     {
           portb.f0 = 1;
           delay_us(1500);
           portb.f0 = 0;
           delay_us(18500);
     }
}
void rotation_180()
{
     unsigned int i;
     for(i=0;i<50;i++)
     {
           portb.f0 = 1;
           delay_us(2200);
           portb.f0 = 0;
           delay_us(17800);
     }
}
void main() {
     TRISB = 0x00;
     while(1)
     {
           rotation_0();
           delay_ms(2000);
           rotation_90();
           delay_ms(2000);
           rotation_180();
           delay_ms(2000);
     }
}