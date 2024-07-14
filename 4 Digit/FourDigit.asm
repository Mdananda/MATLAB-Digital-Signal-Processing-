
_main:

;FourDigit.c,3 :: 		void main() {
;FourDigit.c,4 :: 		int i = 0, a, b, c, d, j;
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
;FourDigit.c,5 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;FourDigit.c,6 :: 		TRISC = 0x00;
	CLRF       TRISC+0
;FourDigit.c,7 :: 		TRISD = 0xff;
	MOVLW      255
	MOVWF      TRISD+0
;FourDigit.c,9 :: 		portb = 0x00;
	CLRF       PORTB+0
;FourDigit.c,10 :: 		portc = 0x00;
	CLRF       PORTC+0
;FourDigit.c,12 :: 		j = i;
	MOVF       main_i_L0+0, 0
	MOVWF      main_j_L0+0
	MOVF       main_i_L0+1, 0
	MOVWF      main_j_L0+1
;FourDigit.c,13 :: 		while(1){
L_main0:
;FourDigit.c,14 :: 		i = j;
	MOVF       main_j_L0+0, 0
	MOVWF      main_i_L0+0
	MOVF       main_j_L0+1, 0
	MOVWF      main_i_L0+1
;FourDigit.c,15 :: 		a = i / 1000;
	MOVLW      232
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	MOVF       main_j_L0+0, 0
	MOVWF      R0+0
	MOVF       main_j_L0+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      FLOC__main+2
	MOVF       R0+1, 0
	MOVWF      FLOC__main+3
	MOVF       FLOC__main+2, 0
	MOVWF      R0+0
	MOVF       FLOC__main+3, 0
	MOVWF      R0+1
	MOVLW      232
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
;FourDigit.c,16 :: 		i = i - (a*1000);
	MOVF       R0+0, 0
	SUBWF      main_j_L0+0, 0
	MOVWF      FLOC__main+0
	MOVF       R0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      main_j_L0+1, 0
	MOVWF      FLOC__main+1
	MOVF       FLOC__main+0, 0
	MOVWF      main_i_L0+0
	MOVF       FLOC__main+1, 0
	MOVWF      main_i_L0+1
;FourDigit.c,17 :: 		b = i / 100;
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FLOC__main+0, 0
	MOVWF      R0+0
	MOVF       FLOC__main+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      main_b_L0+0
	MOVF       R0+1, 0
	MOVWF      main_b_L0+1
;FourDigit.c,18 :: 		i = i - (b*100);
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVF       R0+0, 0
	SUBWF      FLOC__main+0, 1
	BTFSS      STATUS+0, 0
	DECF       FLOC__main+1, 1
	MOVF       R0+1, 0
	SUBWF      FLOC__main+1, 1
	MOVF       FLOC__main+0, 0
	MOVWF      main_i_L0+0
	MOVF       FLOC__main+1, 0
	MOVWF      main_i_L0+1
;FourDigit.c,19 :: 		c = i / 10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FLOC__main+0, 0
	MOVWF      R0+0
	MOVF       FLOC__main+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      main_c_L0+0
	MOVF       R0+1, 0
	MOVWF      main_c_L0+1
;FourDigit.c,20 :: 		d = i % 10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FLOC__main+0, 0
	MOVWF      R0+0
	MOVF       FLOC__main+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      main_d_L0+0
	MOVF       R0+1, 0
	MOVWF      main_d_L0+1
;FourDigit.c,22 :: 		portb = array[a];
	MOVF       FLOC__main+2, 0
	ADDLW      _array+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;FourDigit.c,23 :: 		portc.f0 = 1;
	BSF        PORTC+0, 0
;FourDigit.c,24 :: 		delay_ms(5);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	NOP
	NOP
;FourDigit.c,25 :: 		portc.f0 = 0;
	BCF        PORTC+0, 0
;FourDigit.c,27 :: 		portb = array[b];
	MOVF       main_b_L0+0, 0
	ADDLW      _array+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;FourDigit.c,28 :: 		portc.f1 = 1;
	BSF        PORTC+0, 1
;FourDigit.c,29 :: 		delay_ms(5);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	NOP
	NOP
;FourDigit.c,30 :: 		portc.f1 = 0;
	BCF        PORTC+0, 1
;FourDigit.c,32 :: 		portb = array[c];
	MOVF       main_c_L0+0, 0
	ADDLW      _array+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;FourDigit.c,33 :: 		portc.f2 = 1;
	BSF        PORTC+0, 2
;FourDigit.c,34 :: 		delay_ms(5);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	NOP
	NOP
;FourDigit.c,35 :: 		portc.f2 = 0;
	BCF        PORTC+0, 2
;FourDigit.c,37 :: 		portb = array[d];
	MOVF       main_d_L0+0, 0
	ADDLW      _array+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;FourDigit.c,38 :: 		portc.f3 = 1;
	BSF        PORTC+0, 3
;FourDigit.c,39 :: 		delay_ms(5);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	NOP
	NOP
;FourDigit.c,40 :: 		portc.f3 = 0;
	BCF        PORTC+0, 3
;FourDigit.c,42 :: 		delay_ms(20);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	NOP
	NOP
;FourDigit.c,44 :: 		j++;
	INCF       main_j_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_j_L0+1, 1
;FourDigit.c,45 :: 		}
	GOTO       L_main0
;FourDigit.c,46 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
