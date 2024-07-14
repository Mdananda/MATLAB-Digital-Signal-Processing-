#line 1 "F:/MicroController Lab/LCD Display/LCDdisplay.c"

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

char text1[] = "Computer Science & Engineering";
char text2[] = "Md Ananda Mia, R-180135, S:2017-18";
void main() {
 int i=0, j=0;
 Adcon1 = 0x06;
 Cmcon = 0x07;
 LCD_Init();
 LCD_cmd(_LCD_CLEAR);
 lcd_cmd(_LCD_cursor_off);
 lcd_out(1,1,text1);
 lcd_out(2,1,text2);
 while(1)
 {
 for(i=0;i<39;i++){
 delay_ms(250);
 lcd_cmd(_lcd_shift_left);
 delay_ms(250);
 }
 for(j=0;j<39;j++){
 delay_ms(250);
 lcd_cmd(_lcd_shift_right);
 delay_ms(250);
 }
 }

}
