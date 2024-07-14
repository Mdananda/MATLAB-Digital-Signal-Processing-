void main() {

TRISB = 0X00;
PORTB = 0X00;
    while(1){
       PORTB.F0 = 0XFF;
       DELAY_MS(1000);
       PORTB.F0 = 0X00;
       DELAY_MS(200);
    }
}