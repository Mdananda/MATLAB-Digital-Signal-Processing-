
_main:

;TwoDigit.c,3 :: 		void main() {
;TwoDigit.c,4 :: 		int i = 0, left = 0, right = 0, j;
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
	CLRF       main_right_L0+0
	CLRF       main_right_L0+1
;TwoDigit.c,5 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;TwoDigit.c,6 :: 		TRISC = 0x00;
	CLRF       TRISC+0
;TwoDigit.c,7 :: 		TRISD = 0xff;
	MOVLW      255
	MOVWF      TRISD+0
;TwoDigit.c,9 :: 		portb = 0x00;
	CLRF       PORTB+0
;TwoDigit.c,10 :: 		portc = 0x00;
	CLRF       PORTC+0
;TwoDigit.c,12 :: 		while(1){
L_main0:
;TwoDigit.c,13 :: 		left = i / 10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       main_i_L0+0, 0
	MOVWF      R0+0
	MOVF       main_i_L0+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      FLOC__main+0
	MOVF       R0+1, 0
	MOVWF      FLOC__main+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       main_i_L0+0, 0
	MOVWF      R0+0
	MOVF       main_i_L0+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
;TwoDigit.c,14 :: 		right = i % 10;
	MOVF       R0+0, 0
	MOVWF      main_right_L0+0
	MOVF       R0+1, 0
	MOVWF      main_right_L0+1
;TwoDigit.c,16 :: 		portb = array[left];
	MOVF       FLOC__main+0, 0
	ADDLW      _array+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;TwoDigit.c,17 :: 		portc.f0 = 1;
	BSF        PORTC+0, 0
;TwoDigit.c,18 :: 		delay_ms(5);
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
;TwoDigit.c,19 :: 		portc.f0 = 0;
	BCF        PORTC+0, 0
;TwoDigit.c,21 :: 		portb = array[right];
	MOVF       main_right_L0+0, 0
	ADDLW      _array+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;TwoDigit.c,22 :: 		portc.f1 = 1;
	BSF        PORTC+0, 1
;TwoDigit.c,23 :: 		delay_ms(5);
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
;TwoDigit.c,24 :: 		portc.f1 = 0;
	BCF        PORTC+0, 1
;TwoDigit.c,26 :: 		if(portd.f0 == 0 && i < 99)
	BTFSC      PORTD+0, 0
	GOTO       L_main6
	MOVLW      128
	XORWF      main_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main23
	MOVLW      99
	SUBWF      main_i_L0+0, 0
L__main23:
	BTFSC      STATUS+0, 0
	GOTO       L_main6
L__main21:
;TwoDigit.c,28 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	DECFSZ     R11+0, 1
	GOTO       L_main7
	NOP
;TwoDigit.c,29 :: 		if(portd.f0 == 0 && i < 99)
	BTFSC      PORTD+0, 0
	GOTO       L_main10
	MOVLW      128
	XORWF      main_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main24
	MOVLW      99
	SUBWF      main_i_L0+0, 0
L__main24:
	BTFSC      STATUS+0, 0
	GOTO       L_main10
L__main20:
;TwoDigit.c,31 :: 		i = (i + 1) % 100;
	MOVF       main_i_L0+0, 0
	ADDLW      1
	MOVWF      R0+0
	MOVLW      0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      main_i_L0+1, 0
	MOVWF      R0+1
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      main_i_L0+0
	MOVF       R0+1, 0
	MOVWF      main_i_L0+1
;TwoDigit.c,32 :: 		}
L_main10:
;TwoDigit.c,33 :: 		}
L_main6:
;TwoDigit.c,35 :: 		if(portd.f1 == 0 && i > 0)
	BTFSC      PORTD+0, 1
	GOTO       L_main13
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_i_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main25
	MOVF       main_i_L0+0, 0
	SUBLW      0
L__main25:
	BTFSC      STATUS+0, 0
	GOTO       L_main13
L__main19:
;TwoDigit.c,37 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main14:
	DECFSZ     R13+0, 1
	GOTO       L_main14
	DECFSZ     R12+0, 1
	GOTO       L_main14
	DECFSZ     R11+0, 1
	GOTO       L_main14
	NOP
;TwoDigit.c,38 :: 		if(portd.f1 == 0 && i > 0)
	BTFSC      PORTD+0, 1
	GOTO       L_main17
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_i_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main26
	MOVF       main_i_L0+0, 0
	SUBLW      0
L__main26:
	BTFSC      STATUS+0, 0
	GOTO       L_main17
L__main18:
;TwoDigit.c,40 :: 		i = (i - 1) % 100;
	MOVLW      1
	SUBWF      main_i_L0+0, 0
	MOVWF      R0+0
	MOVLW      0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      main_i_L0+1, 0
	MOVWF      R0+1
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      main_i_L0+0
	MOVF       R0+1, 0
	MOVWF      main_i_L0+1
;TwoDigit.c,41 :: 		}
L_main17:
;TwoDigit.c,42 :: 		}
L_main13:
;TwoDigit.c,43 :: 		}
	GOTO       L_main0
;TwoDigit.c,44 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
