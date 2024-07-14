char array[] = {0xC0, 0xF9, 0xA4, 0xB0, 0x99, 0x92, 0x83, 0xF8, 0x80, 0x90};

void main() {
int i = 0, a, b, c, d, j;
TRISB = 0x00;
TRISC = 0x00;
TRISD = 0xff;

portb = 0x00;
portc = 0x00;

j = i;
while(1){
    i = j;
    a = i / 1000;
    i = i - (a*1000);
    b = i / 100;
    i = i - (b*100);
    c = i / 10;
    d = i % 10;

    portb = array[a];
    portc.f0 = 1;
    delay_ms(5);
    portc.f0 = 0;

    portb = array[b];
    portc.f1 = 1;
    delay_ms(5);
    portc.f1 = 0;
    
    portb = array[c];
    portc.f2 = 1;
    delay_ms(5);
    portc.f2 = 0;

    portb = array[d];
    portc.f3 = 1;
    delay_ms(5);
    portc.f3 = 0;
    
    delay_ms(20);

    j++;
  }
}