//LCD display connection
sbit LCD_RS at Rb0_bit;
sbit LCD_EN at Rb1_bit;
sbit LCD_D4 at Rb2_bit;
sbit LCD_D5 at Rb3_bit;
sbit LCD_D6 at Rb4_bit;
sbit LCD_D7 at Rb5_bit;

sbit LCD_RS_Direction at TRISB0_bit;
sbit LCD_EN_Direction at TRISB1_bit;
sbit LCD_D4_Direction at TRISB2_bit;
sbit LCD_D5_Direction at TRISB3_bit;
sbit LCD_D6_Direction at TRISB4_bit;
sbit LCD_D7_Direction at TRISB5_bit;

char disp[16]="";
void main() {
      int result;
      float volt, temp;
      trisa = 0xff;
      lcd_init();
      lcd_cmd(_lcd_clear);
      lcd_cmd(_lcd_cursor_off);

      while(1)
      {
            result = adc_read(1);
            volt = result*4.88;
            temp = volt/10;
            lcd_out(1,1,"Temp=");
            floattostr(temp,disp);
            lcd_out_cp(disp);
            lcd_chr(1,15,223);
            lcd_out_cp("C");
      }
}