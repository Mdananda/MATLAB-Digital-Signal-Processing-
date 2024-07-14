
_main:

;LCDdisplay.c,18 :: 		void main() {
;LCDdisplay.c,19 :: 		int i=0, j=0;
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
	CLRF       main_j_L0+0
	CLRF       main_j_L0+1
;LCDdisplay.c,20 :: 		Adcon1 = 0x06;  //Analog pin disabling in PORTA
	MOVLW      6
	MOVWF      ADCON1+0
;LCDdisplay.c,21 :: 		Cmcon = 0x07;  //Comparator pin disabling PORTA
	MOVLW      7
	MOVWF      CMCON+0
;LCDdisplay.c,22 :: 		LCD_Init();     //Initialize LCD
	CALL       _Lcd_Init+0
;LCDdisplay.c,23 :: 		LCD_cmd(_LCD_CLEAR);   //Clearing LCD display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCDdisplay.c,24 :: 		lcd_cmd(_LCD_cursor_off);   //Cursor off statement
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCDdisplay.c,25 :: 		lcd_out(1,1,text1);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _text1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LCDdisplay.c,26 :: 		lcd_out(2,1,text2);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _text2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LCDdisplay.c,27 :: 		while(1)
L_main0:
;LCDdisplay.c,29 :: 		for(i=0;i<39;i++){
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
L_main2:
	MOVLW      128
	XORWF      main_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main13
	MOVLW      39
	SUBWF      main_i_L0+0, 0
L__main13:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;LCDdisplay.c,30 :: 		delay_ms(250);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
	NOP
;LCDdisplay.c,31 :: 		lcd_cmd(_lcd_shift_left);
	MOVLW      24
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCDdisplay.c,32 :: 		delay_ms(250);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	DECFSZ     R11+0, 1
	GOTO       L_main6
	NOP
	NOP
;LCDdisplay.c,29 :: 		for(i=0;i<39;i++){
	INCF       main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_i_L0+1, 1
;LCDdisplay.c,33 :: 		}
	GOTO       L_main2
L_main3:
;LCDdisplay.c,34 :: 		for(j=0;j<39;j++){
	CLRF       main_j_L0+0
	CLRF       main_j_L0+1
L_main7:
	MOVLW      128
	XORWF      main_j_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main14
	MOVLW      39
	SUBWF      main_j_L0+0, 0
L__main14:
	BTFSC      STATUS+0, 0
	GOTO       L_main8
;LCDdisplay.c,35 :: 		delay_ms(250);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main10:
	DECFSZ     R13+0, 1
	GOTO       L_main10
	DECFSZ     R12+0, 1
	GOTO       L_main10
	DECFSZ     R11+0, 1
	GOTO       L_main10
	NOP
	NOP
;LCDdisplay.c,36 :: 		lcd_cmd(_lcd_shift_right);
	MOVLW      28
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCDdisplay.c,37 :: 		delay_ms(250);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main11:
	DECFSZ     R13+0, 1
	GOTO       L_main11
	DECFSZ     R12+0, 1
	GOTO       L_main11
	DECFSZ     R11+0, 1
	GOTO       L_main11
	NOP
	NOP
;LCDdisplay.c,34 :: 		for(j=0;j<39;j++){
	INCF       main_j_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_j_L0+1, 1
;LCDdisplay.c,38 :: 		}
	GOTO       L_main7
L_main8:
;LCDdisplay.c,39 :: 		}
	GOTO       L_main0
;LCDdisplay.c,41 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
