
_rotation_0:

;lab10_c.c,1 :: 		void rotation_0()
;lab10_c.c,4 :: 		for(i=0;i<50;i++)
	CLRF       R1+0
	CLRF       R1+1
L_rotation_00:
	MOVLW      0
	SUBWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__rotation_021
	MOVLW      50
	SUBWF      R1+0, 0
L__rotation_021:
	BTFSC      STATUS+0, 0
	GOTO       L_rotation_01
;lab10_c.c,6 :: 		portb.f0 = 1;
	BSF        PORTB+0, 0
;lab10_c.c,7 :: 		delay_us(800);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      18
	MOVWF      R13+0
L_rotation_03:
	DECFSZ     R13+0, 1
	GOTO       L_rotation_03
	DECFSZ     R12+0, 1
	GOTO       L_rotation_03
	NOP
;lab10_c.c,8 :: 		portb.f0 = 0;
	BCF        PORTB+0, 0
;lab10_c.c,9 :: 		delay_us(19200);
	MOVLW      50
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_rotation_04:
	DECFSZ     R13+0, 1
	GOTO       L_rotation_04
	DECFSZ     R12+0, 1
	GOTO       L_rotation_04
	NOP
	NOP
;lab10_c.c,4 :: 		for(i=0;i<50;i++)
	INCF       R1+0, 1
	BTFSC      STATUS+0, 2
	INCF       R1+1, 1
;lab10_c.c,10 :: 		}
	GOTO       L_rotation_00
L_rotation_01:
;lab10_c.c,11 :: 		}
L_end_rotation_0:
	RETURN
; end of _rotation_0

_rotation_90:

;lab10_c.c,12 :: 		void rotation_90()
;lab10_c.c,15 :: 		for(i=0;i<50;i++)
	CLRF       R1+0
	CLRF       R1+1
L_rotation_905:
	MOVLW      0
	SUBWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__rotation_9023
	MOVLW      50
	SUBWF      R1+0, 0
L__rotation_9023:
	BTFSC      STATUS+0, 0
	GOTO       L_rotation_906
;lab10_c.c,17 :: 		portb.f0 = 1;
	BSF        PORTB+0, 0
;lab10_c.c,18 :: 		delay_us(1500);
	MOVLW      4
	MOVWF      R12+0
	MOVLW      228
	MOVWF      R13+0
L_rotation_908:
	DECFSZ     R13+0, 1
	GOTO       L_rotation_908
	DECFSZ     R12+0, 1
	GOTO       L_rotation_908
	NOP
;lab10_c.c,19 :: 		portb.f0 = 0;
	BCF        PORTB+0, 0
;lab10_c.c,20 :: 		delay_us(18500);
	MOVLW      49
	MOVWF      R12+0
	MOVLW      11
	MOVWF      R13+0
L_rotation_909:
	DECFSZ     R13+0, 1
	GOTO       L_rotation_909
	DECFSZ     R12+0, 1
	GOTO       L_rotation_909
	NOP
	NOP
;lab10_c.c,15 :: 		for(i=0;i<50;i++)
	INCF       R1+0, 1
	BTFSC      STATUS+0, 2
	INCF       R1+1, 1
;lab10_c.c,21 :: 		}
	GOTO       L_rotation_905
L_rotation_906:
;lab10_c.c,22 :: 		}
L_end_rotation_90:
	RETURN
; end of _rotation_90

_rotation_180:

;lab10_c.c,23 :: 		void rotation_180()
;lab10_c.c,26 :: 		for(i=0;i<50;i++)
	CLRF       R1+0
	CLRF       R1+1
L_rotation_18010:
	MOVLW      0
	SUBWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__rotation_18025
	MOVLW      50
	SUBWF      R1+0, 0
L__rotation_18025:
	BTFSC      STATUS+0, 0
	GOTO       L_rotation_18011
;lab10_c.c,28 :: 		portb.f0 = 1;
	BSF        PORTB+0, 0
;lab10_c.c,29 :: 		delay_us(2200);
	MOVLW      6
	MOVWF      R12+0
	MOVLW      181
	MOVWF      R13+0
L_rotation_18013:
	DECFSZ     R13+0, 1
	GOTO       L_rotation_18013
	DECFSZ     R12+0, 1
	GOTO       L_rotation_18013
	NOP
	NOP
;lab10_c.c,30 :: 		portb.f0 = 0;
	BCF        PORTB+0, 0
;lab10_c.c,31 :: 		delay_us(17800);
	MOVLW      47
	MOVWF      R12+0
	MOVLW      58
	MOVWF      R13+0
L_rotation_18014:
	DECFSZ     R13+0, 1
	GOTO       L_rotation_18014
	DECFSZ     R12+0, 1
	GOTO       L_rotation_18014
	NOP
;lab10_c.c,26 :: 		for(i=0;i<50;i++)
	INCF       R1+0, 1
	BTFSC      STATUS+0, 2
	INCF       R1+1, 1
;lab10_c.c,32 :: 		}
	GOTO       L_rotation_18010
L_rotation_18011:
;lab10_c.c,33 :: 		}
L_end_rotation_180:
	RETURN
; end of _rotation_180

_main:

;lab10_c.c,34 :: 		void main() {
;lab10_c.c,35 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;lab10_c.c,36 :: 		while(1)
L_main15:
;lab10_c.c,38 :: 		rotation_0();
	CALL       _rotation_0+0
;lab10_c.c,39 :: 		delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main17:
	DECFSZ     R13+0, 1
	GOTO       L_main17
	DECFSZ     R12+0, 1
	GOTO       L_main17
	DECFSZ     R11+0, 1
	GOTO       L_main17
	NOP
;lab10_c.c,40 :: 		rotation_90();
	CALL       _rotation_90+0
;lab10_c.c,41 :: 		delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main18:
	DECFSZ     R13+0, 1
	GOTO       L_main18
	DECFSZ     R12+0, 1
	GOTO       L_main18
	DECFSZ     R11+0, 1
	GOTO       L_main18
	NOP
;lab10_c.c,42 :: 		rotation_180();
	CALL       _rotation_180+0
;lab10_c.c,43 :: 		delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main19:
	DECFSZ     R13+0, 1
	GOTO       L_main19
	DECFSZ     R12+0, 1
	GOTO       L_main19
	DECFSZ     R11+0, 1
	GOTO       L_main19
	NOP
;lab10_c.c,44 :: 		}
	GOTO       L_main15
;lab10_c.c,45 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
