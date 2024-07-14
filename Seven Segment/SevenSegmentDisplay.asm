
_main:

;SevenSegmentDisplay.c,3 :: 		void main() {
;SevenSegmentDisplay.c,4 :: 		TRISD = 0x00;
	CLRF       TRISD+0
;SevenSegmentDisplay.c,5 :: 		PORTD = 0xff;
	MOVLW      255
	MOVWF      PORTD+0
;SevenSegmentDisplay.c,7 :: 		while(i < 10){
L_main0:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main4
	MOVLW      10
	SUBWF      _i+0, 0
L__main4:
	BTFSC      STATUS+0, 0
	GOTO       L_main1
;SevenSegmentDisplay.c,8 :: 		portd = array[i];
	MOVF       _i+0, 0
	ADDLW      _array+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;SevenSegmentDisplay.c,9 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
	NOP
;SevenSegmentDisplay.c,10 :: 		i = (i+1)%10;
	MOVF       _i+0, 0
	ADDLW      1
	MOVWF      R0+0
	MOVLW      0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _i+1, 0
	MOVWF      R0+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _i+0
	MOVF       R0+1, 0
	MOVWF      _i+1
;SevenSegmentDisplay.c,11 :: 		}
	GOTO       L_main0
L_main1:
;SevenSegmentDisplay.c,12 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
