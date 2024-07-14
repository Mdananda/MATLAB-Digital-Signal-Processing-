
_main:

;DcMotorControll.c,1 :: 		void main() {
;DcMotorControll.c,2 :: 		short i = 0;
	CLRF       main_i_L0+0
;DcMotorControll.c,3 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;DcMotorControll.c,4 :: 		TRISD = 0xFF;
	MOVLW      255
	MOVWF      TRISD+0
;DcMotorControll.c,5 :: 		PORTB = 0x00;
	CLRF       PORTB+0
;DcMotorControll.c,7 :: 		portb.f0 = 1;
	BSF        PORTB+0, 0
;DcMotorControll.c,8 :: 		portb.f1 = 0;
	BCF        PORTB+0, 1
;DcMotorControll.c,10 :: 		PWM1_Init(5000);
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      99
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;DcMotorControll.c,11 :: 		PWM1_Start();
	CALL       _PWM1_Start+0
;DcMotorControll.c,12 :: 		PWM1_Set_Duty(i);
	MOVF       main_i_L0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;DcMotorControll.c,14 :: 		while(1){
L_main0:
;DcMotorControll.c,15 :: 		if(portd.f0 == 1 && i<250){
	BTFSS      PORTD+0, 0
	GOTO       L_main4
	MOVLW      128
	BTFSC      main_i_L0+0, 7
	MOVLW      127
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main21
	MOVLW      250
	SUBWF      main_i_L0+0, 0
L__main21:
	BTFSC      STATUS+0, 0
	GOTO       L_main4
L__main19:
;DcMotorControll.c,16 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
;DcMotorControll.c,17 :: 		if(portd.f0 == 1 && i<250){
	BTFSS      PORTD+0, 0
	GOTO       L_main8
	MOVLW      128
	BTFSC      main_i_L0+0, 7
	MOVLW      127
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main22
	MOVLW      250
	SUBWF      main_i_L0+0, 0
L__main22:
	BTFSC      STATUS+0, 0
	GOTO       L_main8
L__main18:
;DcMotorControll.c,18 :: 		i = i+10;
	MOVLW      10
	ADDWF      main_i_L0+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      main_i_L0+0
;DcMotorControll.c,19 :: 		PWM1_Set_Duty(i);
	MOVF       R0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;DcMotorControll.c,20 :: 		}
L_main8:
;DcMotorControll.c,21 :: 		}
L_main4:
;DcMotorControll.c,22 :: 		if(portd.f1 == 1 && i>0){
	BTFSS      PORTD+0, 1
	GOTO       L_main11
	MOVLW      128
	XORLW      0
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_i_L0+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main11
L__main17:
;DcMotorControll.c,23 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main12:
	DECFSZ     R13+0, 1
	GOTO       L_main12
	DECFSZ     R12+0, 1
	GOTO       L_main12
	DECFSZ     R11+0, 1
	GOTO       L_main12
	NOP
;DcMotorControll.c,24 :: 		if(portd.f1 == 1 && i>0){
	BTFSS      PORTD+0, 1
	GOTO       L_main15
	MOVLW      128
	XORLW      0
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_i_L0+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main15
L__main16:
;DcMotorControll.c,25 :: 		i = i-10;
	MOVLW      10
	SUBWF      main_i_L0+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      main_i_L0+0
;DcMotorControll.c,26 :: 		PWM1_Set_Duty(i);
	MOVF       R0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;DcMotorControll.c,27 :: 		}
L_main15:
;DcMotorControll.c,28 :: 		}
L_main11:
;DcMotorControll.c,30 :: 		}
	GOTO       L_main0
;DcMotorControll.c,31 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
