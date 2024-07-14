
_main:

;LedBlinking.c,1 :: 		void main() {
;LedBlinking.c,3 :: 		TRISB = 0X00;
	CLRF       TRISB+0
;LedBlinking.c,4 :: 		PORTB = 0X00;
	CLRF       PORTB+0
;LedBlinking.c,5 :: 		while(1){
L_main0:
;LedBlinking.c,6 :: 		PORTB.F0 = 0XFF;
	BSF        PORTB+0, 0
;LedBlinking.c,7 :: 		DELAY_MS(1000);
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
;LedBlinking.c,8 :: 		PORTB.F0 = 0X00;
	BCF        PORTB+0, 0
;LedBlinking.c,9 :: 		DELAY_MS(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
;LedBlinking.c,10 :: 		}
	GOTO       L_main0
;LedBlinking.c,11 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
