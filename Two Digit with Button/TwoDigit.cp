#line 1 "F:/MicroController Lab/Two Digit with Button/TwoDigit.c"
char array[] = {0xC0, 0xF9, 0xA4, 0xB0, 0x99, 0x92, 0x83, 0xF8, 0x80, 0x90};

void main() {
int i = 0, left = 0, right = 0, j;
TRISB = 0x00;
TRISC = 0x00;
TRISD = 0xff;

portb = 0x00;
portc = 0x00;

while(1){
 left = i / 10;
 right = i % 10;

 portb = array[left];
 portc.f0 = 1;
 delay_ms(5);
 portc.f0 = 0;

 portb = array[right];
 portc.f1 = 1;
 delay_ms(5);
 portc.f1 = 0;

 if(portd.f0 == 0 && i < 99)
 {
 delay_ms(100);
 if(portd.f0 == 0 && i < 99)
 {
 i = (i + 1) % 100;
 }
 }

 if(portd.f1 == 0 && i > 0)
 {
 delay_ms(100);
 if(portd.f1 == 0 && i > 0)
 {
 i = (i - 1) % 100;
 }
 }
 }
}
