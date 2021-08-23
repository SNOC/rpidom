opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 10920"

opt pagewidth 120

	opt lm

	processor	12LF1822
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
indf1	equ	1
pc	equ	2
pcl	equ	2
status	equ	3
fsr0l	equ	4
fsr0h	equ	5
fsr1l	equ	6
fsr1h	equ	7
bsr	equ	8
wreg	equ	9
intcon	equ	11
c	equ	1
z	equ	0
pclath	equ	10
# 11 "C:\Users\dom\Dropbox\rpi yad\carte home automation\pic\bootloader\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 11 "C:\Users\dom\Dropbox\rpi yad\carte home automation\pic\bootloader\main.c"
	dw 0xFFFC & 0xFFE7 & 0xFFFF ;#
# 14 "C:\Users\dom\Dropbox\rpi yad\carte home automation\pic\bootloader\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 14 "C:\Users\dom\Dropbox\rpi yad\carte home automation\pic\bootloader\main.c"
	dw 0xFFFF & 0xDFFF ;#
	FNCALL	_main,_put232
	FNCALL	_main,_get232
	FNCALL	_main,_putc232
	FNCALL	_main,_xmodem_receive
	FNCALL	_xmodem_receive,_putc232
	FNCALL	_xmodem_receive,_get232
	FNCALL	_xmodem_receive,_put232
	FNCALL	_put232,_putc232
	FNCALL	_get232,_pause
	FNROOT	_main
	global	_test
	global	_CARRY
psect	text160,local,class=CODE,delta=2
global __ptext160
__ptext160:
_CARRY	set	24
	global	_GIE
_GIE	set	95
	global	_RCIF
_RCIF	set	141
	global	_TXIF
_TXIF	set	140
	global	_OSCCON
_OSCCON	set	153
	global	_TRISA
_TRISA	set	140
	global	_HFIOFS
_HFIOFS	set	1232
	global	_TRISA5
_TRISA5	set	1125
	global	_RXDTSEL
_RXDTSEL	set	2287
	global	_TXCKSEL
_TXCKSEL	set	2282
	global	_EEADR
_EEADR	set	401
	global	_ANSELA
_ANSELA	set	396
	global	_EECON1
_EECON1	set	405
	global	_EECON2
_EECON2	set	406
	global	_EEDATA
_EEDATA	set	403
	global	_RCREG
_RCREG	set	409
	global	_SPBRG
_SPBRG	set	411
	global	_TXREG
_TXREG	set	410
	global	_BRG16
_BRG16	set	3323
	global	_BRGH
_BRGH	set	3314
	global	_CREN
_CREN	set	3308
	global	_RD
_RD	set	3240
	global	_SPEN
_SPEN	set	3311
	global	_SYNC
_SYNC	set	3316
	global	_TXEN
_TXEN	set	3317
	global	_WR
_WR	set	3241
	global	_WREN
_WREN	set	3242
psect	strings,class=STRING,delta=2
global __pstrings
__pstrings:
	global    __stringtab
__stringtab:
	retlw	0
psect	strings
	
STR_3:	
	retlw	10
	retlw	13
	retlw	13
	retlw	10
	retlw	13
	retlw	10
	retlw	66	;'B'
	retlw	111	;'o'
	retlw	111	;'o'
	retlw	116	;'t'
	retlw	108	;'l'
	retlw	111	;'o'
	retlw	97	;'a'
	retlw	100	;'d'
	retlw	101	;'e'
	retlw	114	;'r'
	retlw	32	;' '
	retlw	119	;'w'
	retlw	114	;'r'
	retlw	105	;'i'
	retlw	116	;'t'
	retlw	116	;'t'
	retlw	101	;'e'
	retlw	110	;'n'
	retlw	32	;' '
	retlw	98	;'b'
	retlw	121	;'y'
	retlw	32	;' '
	retlw	68	;'D'
	retlw	111	;'o'
	retlw	109	;'m'
	retlw	105	;'i'
	retlw	110	;'n'
	retlw	105	;'i'
	retlw	113	;'q'
	retlw	117	;'u'
	retlw	101	;'e'
	retlw	32	;' '
	retlw	86	;'V'
	retlw	97	;'a'
	retlw	108	;'l'
	retlw	111	;'o'
	retlw	105	;'i'
	retlw	115	;'s'
	retlw	32	;' '
	retlw	49	;'1'
	retlw	48	;'0'
	retlw	47	;'/'
	retlw	49	;'1'
	retlw	56	;'8'
	retlw	47	;'/'
	retlw	50	;'2'
	retlw	48	;'0'
	retlw	49	;'1'
	retlw	50	;'2'
	retlw	10
	retlw	13
	retlw	0
psect	strings
	
STR_2:	
	retlw	120	;'x'
	retlw	109	;'m'
	retlw	111	;'o'
	retlw	100	;'d'
	retlw	101	;'e'
	retlw	109	;'m'
	retlw	32	;' '
	retlw	116	;'t'
	retlw	105	;'i'
	retlw	109	;'m'
	retlw	101	;'e'
	retlw	111	;'o'
	retlw	117	;'u'
	retlw	116	;'t'
	retlw	32	;' '
	retlw	45	;'-'
	retlw	62	;'>'
	retlw	32	;' '
	retlw	116	;'t'
	retlw	114	;'r'
	retlw	97	;'a'
	retlw	110	;'n'
	retlw	115	;'s'
	retlw	102	;'f'
	retlw	101	;'e'
	retlw	114	;'r'
	retlw	116	;'t'
	retlw	32	;' '
	retlw	97	;'a'
	retlw	98	;'b'
	retlw	111	;'o'
	retlw	114	;'r'
	retlw	116	;'t'
	retlw	13
	retlw	10
	retlw	0
psect	strings
	
STR_1:	
	retlw	120	;'x'
	retlw	109	;'m'
	retlw	111	;'o'
	retlw	100	;'d'
	retlw	101	;'e'
	retlw	109	;'m'
	retlw	32	;' '
	retlw	101	;'e'
	retlw	114	;'r'
	retlw	114	;'r'
	retlw	111	;'o'
	retlw	114	;'r'
	retlw	32	;' '
	retlw	45	;'-'
	retlw	62	;'>'
	retlw	32	;' '
	retlw	116	;'t'
	retlw	114	;'r'
	retlw	97	;'a'
	retlw	110	;'n'
	retlw	115	;'s'
	retlw	102	;'f'
	retlw	101	;'e'
	retlw	114	;'r'
	retlw	116	;'t'
	retlw	32	;' '
	retlw	97	;'a'
	retlw	98	;'b'
	retlw	111	;'o'
	retlw	114	;'r'
	retlw	116	;'t'
	retlw	13
	retlw	10
	retlw	0
psect	strings
	
STR_8:	
	retlw	32	;' '
	retlw	32	;' '
	retlw	100	;'d'
	retlw	32	;' '
	retlw	58	;':'
	retlw	32	;' '
	retlw	100	;'d'
	retlw	111	;'o'
	retlw	119	;'w'
	retlw	110	;'n'
	retlw	108	;'l'
	retlw	111	;'o'
	retlw	97	;'a'
	retlw	100	;'d'
	retlw	32	;' '
	retlw	97	;'a'
	retlw	32	;' '
	retlw	104	;'h'
	retlw	101	;'e'
	retlw	120	;'x'
	retlw	32	;' '
	retlw	102	;'f'
	retlw	105	;'i'
	retlw	108	;'l'
	retlw	101	;'e'
	retlw	13
	retlw	10
	retlw	0
psect	strings
	
STR_7:	
	retlw	65	;'A'
	retlw	118	;'v'
	retlw	97	;'a'
	retlw	105	;'i'
	retlw	108	;'l'
	retlw	97	;'a'
	retlw	98	;'b'
	retlw	108	;'l'
	retlw	101	;'e'
	retlw	32	;' '
	retlw	99	;'c'
	retlw	111	;'o'
	retlw	109	;'m'
	retlw	109	;'m'
	retlw	97	;'a'
	retlw	110	;'n'
	retlw	100	;'d'
	retlw	115	;'s'
	retlw	32	;' '
	retlw	58	;':'
	retlw	13
	retlw	10
	retlw	0
psect	strings
	
STR_5:	
	retlw	72	;'H'
	retlw	101	;'e'
	retlw	120	;'x'
	retlw	32	;' '
	retlw	102	;'f'
	retlw	105	;'i'
	retlw	108	;'l'
	retlw	101	;'e'
	retlw	32	;' '
	retlw	100	;'d'
	retlw	111	;'o'
	retlw	119	;'w'
	retlw	110	;'n'
	retlw	108	;'l'
	retlw	111	;'o'
	retlw	97	;'a'
	retlw	100	;'d'
	retlw	105	;'i'
	retlw	110	;'n'
	retlw	103	;'g'
	retlw	13
	retlw	10
	retlw	0
psect	strings
	
STR_6:	
	retlw	69	;'E'
	retlw	110	;'n'
	retlw	100	;'d'
	retlw	32	;' '
	retlw	111	;'o'
	retlw	102	;'f'
	retlw	32	;' '
	retlw	116	;'t'
	retlw	114	;'r'
	retlw	97	;'a'
	retlw	110	;'n'
	retlw	115	;'s'
	retlw	102	;'f'
	retlw	101	;'e'
	retlw	114	;'r'
	retlw	116	;'t'
	retlw	13
	retlw	10
	retlw	0
psect	strings
STR_4	equ	STR_7+20
	file	"bootloader.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_test:
       ds      64

psect clrtext,class=CODE,delta=2
global clear_ram
;	Called with FSR0 containing the base address, and
;	WREG with the size to clear
clear_ram:
	clrwdt			;clear the watchdog before getting into this loop
clrloop:
	clrf	indf0		;clear RAM location pointed to by FSR
	addfsr	0,1
	decfsz wreg		;Have we reached the end of clearing yet?
	goto clrloop	;have we reached the end yet?
	retlw	0		;all done for this memory range, return
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	global __pbssBANK0
	movlw	low(__pbssBANK0)
	movwf	fsr0l
	movlw	high(__pbssBANK0)
	movwf	fsr0h
	movlw	040h
	fcall	clear_ram
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
movlb 0
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_pause
?_pause:	; 0 bytes @ 0x0
	global	??_pause
??_pause:	; 0 bytes @ 0x0
	global	?_putc232
?_putc232:	; 0 bytes @ 0x0
	global	??_putc232
??_putc232:	; 0 bytes @ 0x0
	global	?_xmodem_receive
?_xmodem_receive:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	putc232@data
putc232@data:	; 1 bytes @ 0x0
	global	pause@tempo
pause@tempo:	; 2 bytes @ 0x0
	ds	1
	global	?_put232
?_put232:	; 0 bytes @ 0x1
	global	put232@pData
put232@pData:	; 2 bytes @ 0x1
	ds	1
	global	?_get232
?_get232:	; 1 bytes @ 0x2
	global	get232@timeout
get232@timeout:	; 2 bytes @ 0x2
	ds	1
	global	??_put232
??_put232:	; 0 bytes @ 0x3
	ds	1
	global	get232@pData
get232@pData:	; 1 bytes @ 0x4
	ds	1
	global	??_get232
??_get232:	; 0 bytes @ 0x5
	ds	1
	global	??_xmodem_receive
??_xmodem_receive:	; 0 bytes @ 0x6
	ds	1
	global	xmodem_receive@checksumCalcule
xmodem_receive@checksumCalcule:	; 1 bytes @ 0x7
	ds	1
	global	xmodem_receive@nBlock
xmodem_receive@nBlock:	; 1 bytes @ 0x8
	ds	1
	global	xmodem_receive@checksumRecu
xmodem_receive@checksumRecu:	; 1 bytes @ 0x9
	ds	1
	global	xmodem_receive@received
xmodem_receive@received:	; 1 bytes @ 0xA
	ds	1
	global	xmodem_receive@onContinue
xmodem_receive@onContinue:	; 1 bytes @ 0xB
	ds	1
	global	xmodem_receive@loop
xmodem_receive@loop:	; 1 bytes @ 0xC
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0xD
	ds	1
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	main@received
main@received:	; 1 bytes @ 0x0
	ds	1
;;Data sizes: Strings 221, constant 0, data 0, bss 64, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     14      14
;; BANK0           80      1      65
;; BANK1           32      0       0

;;
;; Pointer list with targets:

;; put232@pData	PTR unsigned char  size(2) Largest target is 64
;;		 -> STR_8(CODE[28]), STR_7(CODE[23]), STR_6(CODE[19]), STR_5(CODE[23]), 
;;		 -> STR_4(CODE[3]), STR_3(CODE[58]), test(BANK0[64]), STR_2(CODE[36]), 
;;		 -> STR_1(CODE[34]), 
;;
;; get232@pData	PTR unsigned char  size(1) Largest target is 64
;;		 -> main@received(BANK0[1]), xmodem_receive@checksumRecu(COMMON[1]), test(BANK0[64]), xmodem_receive@nBlock(COMMON[1]), 
;;		 -> xmodem_receive@received(COMMON[1]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_xmodem_receive
;;   _xmodem_receive->_get232
;;   _put232->_putc232
;;   _get232->_pause
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 1, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 2     2      0     792
;;                                             13 COMMON     1     1      0
;;                                              0 BANK0      1     1      0
;;                             _put232
;;                             _get232
;;                            _putc232
;;                     _xmodem_receive
;; ---------------------------------------------------------------------------------
;; (1) _xmodem_receive                                       8     8      0     546
;;                                              6 COMMON     7     7      0
;;                            _putc232
;;                             _get232
;;                             _put232
;; ---------------------------------------------------------------------------------
;; (2) _put232                                               2     0      2      67
;;                                              1 COMMON     2     0      2
;;                            _putc232
;; ---------------------------------------------------------------------------------
;; (2) _get232                                               4     1      3      89
;;                                              2 COMMON     4     1      3
;;                              _pause
;; ---------------------------------------------------------------------------------
;; (3) _putc232                                              1     1      0      22
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (3) _pause                                                2     2      0      23
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _put232
;;     _putc232
;;   _get232
;;     _pause
;;   _putc232
;;   _xmodem_receive
;;     _putc232
;;     _get232
;;       _pause
;;     _put232
;;       _putc232
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BIGRAM              70      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;BITCOMMON            E      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;COMMON               E      E       E       2      100.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR2              0      0       0       3        0.0%
;;SFR2                 0      0       0       3        0.0%
;;STACK                0      0       3       3        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;ABS                  0      0      4F       4        0.0%
;;BITBANK0            50      0       0       5        0.0%
;;BITSFR4              0      0       0       5        0.0%
;;SFR4                 0      0       0       5        0.0%
;;BANK0               50      1      41       6       81.3%
;;BITSFR5              0      0       0       6        0.0%
;;SFR5                 0      0       0       6        0.0%
;;BITBANK1            20      0       0       7        0.0%
;;BITSFR6              0      0       0       7        0.0%
;;SFR6                 0      0       0       7        0.0%
;;BANK1               20      0       0       8        0.0%
;;BITSFR7              0      0       0       8        0.0%
;;SFR7                 0      0       0       8        0.0%
;;BITSFR8              0      0       0       9        0.0%
;;SFR8                 0      0       0       9        0.0%
;;DATA                 0      0      52       9        0.0%
;;BITSFR9              0      0       0      10        0.0%
;;SFR9                 0      0       0      10        0.0%
;;BITSFR10             0      0       0      11        0.0%
;;SFR10                0      0       0      11        0.0%
;;BITSFR11             0      0       0      12        0.0%
;;SFR11                0      0       0      12        0.0%
;;BITSFR12             0      0       0      13        0.0%
;;SFR12                0      0       0      13        0.0%
;;BITSFR13             0      0       0      14        0.0%
;;SFR13                0      0       0      14        0.0%
;;BITSFR14             0      0       0      15        0.0%
;;SFR14                0      0       0      15        0.0%
;;BITSFR15             0      0       0      16        0.0%
;;SFR15                0      0       0      16        0.0%
;;BITSFR16             0      0       0      17        0.0%
;;SFR16                0      0       0      17        0.0%
;;BITSFR17             0      0       0      18        0.0%
;;SFR17                0      0       0      18        0.0%
;;BITSFR18             0      0       0      19        0.0%
;;SFR18                0      0       0      19        0.0%
;;BITSFR19             0      0       0      20        0.0%
;;SFR19                0      0       0      20        0.0%
;;BITSFR20             0      0       0      21        0.0%
;;SFR20                0      0       0      21        0.0%
;;BITSFR21             0      0       0      22        0.0%
;;SFR21                0      0       0      22        0.0%
;;BITSFR22             0      0       0      23        0.0%
;;SFR22                0      0       0      23        0.0%
;;BITSFR23             0      0       0      24        0.0%
;;SFR23                0      0       0      24        0.0%
;;BITSFR24             0      0       0      25        0.0%
;;SFR24                0      0       0      25        0.0%
;;BITSFR25             0      0       0      26        0.0%
;;SFR25                0      0       0      26        0.0%
;;BITSFR26             0      0       0      27        0.0%
;;SFR26                0      0       0      27        0.0%
;;BITSFR27             0      0       0      28        0.0%
;;SFR27                0      0       0      28        0.0%
;;BITSFR28             0      0       0      29        0.0%
;;SFR28                0      0       0      29        0.0%
;;BITSFR29             0      0       0      30        0.0%
;;SFR29                0      0       0      30        0.0%
;;BITSFR30             0      0       0      31        0.0%
;;SFR30                0      0       0      31        0.0%
;;BITSFR31             0      0       0      32        0.0%
;;SFR31                0      0       0      32        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 123 in file "C:\Users\dom\Dropbox\rpi yad\carte home automation\pic\bootloader\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  received        1    0[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr1l, fsr1h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       1       0
;;      Temps:          1       0       0
;;      Totals:         1       1       0
;;Total ram usage:        2 bytes
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_put232
;;		_get232
;;		_putc232
;;		_xmodem_receive
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\dom\Dropbox\rpi yad\carte home automation\pic\bootloader\main.c"
	line	123
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 13
; Regs used in _main: [wreg-status,0+pclath+cstack]
	line	126
	
l3779:	
;main.c: 124: char received;
;main.c: 126: ANSELA = 0;
	movlb 3	; select bank3
	clrf	(396)^0180h	;volatile
	line	127
;main.c: 127: TRISA = 0;
	movlb 1	; select bank1
	clrf	(140)^080h	;volatile
	line	129
	
l3781:	
;main.c: 129: OSCCON = 0b11110000;
	movlw	(0F0h)
	movwf	(153)^080h	;volatile
	line	130
;main.c: 130: while(!HFIOFS);
	goto	l1199
	
l1200:	
	
l1199:	
	btfss	(1232/8)^080h,(1232)&7
	goto	u2531
	goto	u2530
u2531:
	goto	l1199
u2530:
	
l1201:	
	line	138
;main.c: 138: TRISA5 = 1;
	bsf	(1125/8)^080h,(1125)&7
	line	139
;main.c: 139: RXDTSEL = 1;
	movlb 2	; select bank2
	bsf	(2287/8)^0100h,(2287)&7
	line	140
;main.c: 140: TXCKSEL = 1;
	bsf	(2282/8)^0100h,(2282)&7
	line	144
	
l3783:	
;main.c: 144: SPBRG = 16;
	movlw	(010h)
	movlb 3	; select bank3
	movwf	(411)^0180h	;volatile
	line	145
	
l3785:	
;main.c: 145: BRG16 = 0;
	bcf	(3323/8)^0180h,(3323)&7
	line	147
	
l3787:	
;main.c: 147: SPEN = 1;
	bsf	(3311/8)^0180h,(3311)&7
	line	148
	
l3789:	
;main.c: 148: CREN = 1;
	bsf	(3308/8)^0180h,(3308)&7
	line	149
	
l3791:	
;main.c: 149: TXEN = 1;
	bsf	(3317/8)^0180h,(3317)&7
	line	150
	
l3793:	
;main.c: 150: BRGH = 1;
	bsf	(3314/8)^0180h,(3314)&7
	line	151
	
l3795:	
;main.c: 151: SYNC = 0;
	bcf	(3316/8)^0180h,(3316)&7
	line	153
	
l3797:	
;main.c: 153: put232((char*)"\n\r\r\n\r\nBootloader written by Dominique Valois 10/18/2012\n\r");
	movlw	low(STR_3|8000h)
	movwf	(?_put232)
	movlw	high(STR_3|8000h)
	movwf	(?_put232+1)
	fcall	_put232
	goto	l3799
	line	155
;main.c: 155: while(1) {
	
l1202:	
	line	156
	
l3799:	
;main.c: 156: if (get232(0, &received)) {
	movlw	low(0)
	movwf	(?_get232)
	movlw	high(0)
	movwf	((?_get232))+1
	movlw	(main@received)&0ffh
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_get232)+02h
	fcall	_get232
	xorlw	0&0ffh
	skipnz
	goto	u2541
	goto	u2540
u2541:
	goto	l3799
u2540:
	line	157
	
l3801:	
;main.c: 157: putc232(received);
	movlb 0	; select bank0
	movf	(main@received),w
	fcall	_putc232
	line	158
	
l3803:	
;main.c: 158: put232("\r\n");
	movlw	low(STR_4|8000h)
	movwf	(?_put232)
	movlw	high(STR_4|8000h)
	movwf	(?_put232+1)
	fcall	_put232
	line	160
;main.c: 160: switch(received) {
	goto	l3815
	line	161
;main.c: 161: case 'd':
	
l1205:	
	line	162
	
l3805:	
;main.c: 162: put232("Hex file downloading\r\n");
	movlw	low(STR_5|8000h)
	movwf	(?_put232)
	movlw	high(STR_5|8000h)
	movwf	(?_put232+1)
	fcall	_put232
	line	163
	
l3807:	
;main.c: 163: xmodem_receive();
	fcall	_xmodem_receive
	line	164
	
l3809:	
;main.c: 164: put232("End of transfert\r\n");
	movlw	low(STR_6|8000h)
	movwf	(?_put232)
	movlw	high(STR_6|8000h)
	movwf	(?_put232+1)
	fcall	_put232
	line	165
;main.c: 165: break;
	goto	l3799
	line	166
;main.c: 166: default:
	
l1207:	
	line	167
	
l3811:	
;main.c: 167: put232("Available commands :\r\n");
	movlw	low(STR_7|8000h)
	movwf	(?_put232)
	movlw	high(STR_7|8000h)
	movwf	(?_put232+1)
	fcall	_put232
	line	168
;main.c: 168: put232("  d : download a hex file\r\n");
	movlw	low(STR_8|8000h)
	movwf	(?_put232)
	movlw	high(STR_8|8000h)
	movwf	(?_put232+1)
	fcall	_put232
	line	169
;main.c: 169: break;
	goto	l3799
	line	170
	
l3813:	
;main.c: 170: }
	goto	l3799
	line	160
	
l1204:	
	
l3815:	
	movlb 0	; select bank0
	movf	(main@received),w
	; Switch size 1, requested type "space"
; Number of cases is 1, Range of values is 100 to 100
; switch strategies available:
; Name         Instructions Cycles
; simple_byte            4     3 (average)
; direct_byte           11     9 (fixed)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	100^0	; case 100
	skipnz
	goto	l3805
	goto	l3811
	opt asmopt_on

	line	170
	
l1206:	
	goto	l3799
	line	171
	
l1203:	
	goto	l3799
	line	172
	
l1208:	
	line	155
	goto	l3799
	
l1209:	
	line	173
	
l1210:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_xmodem_receive
psect	text161,local,class=CODE,delta=2
global __ptext161
__ptext161:

;; *************** function _xmodem_receive *****************
;; Defined at:
;;		line 64 in file "C:\Users\dom\Dropbox\rpi yad\carte home automation\pic\bootloader\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  loop            1   12[COMMON] unsigned char 
;;  onContinue      1   11[COMMON] unsigned char 
;;  received        1   10[COMMON] unsigned char 
;;  checksumRecu    1    9[COMMON] unsigned char 
;;  nBlock          1    8[COMMON] unsigned char 
;;  checksumCalc    1    7[COMMON] unsigned char 
;;  data128         1    0        unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr1l, fsr1h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         6       0       0
;;      Temps:          1       0       0
;;      Totals:         7       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_putc232
;;		_get232
;;		_put232
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text161
	file	"C:\Users\dom\Dropbox\rpi yad\carte home automation\pic\bootloader\main.c"
	line	64
	global	__size_of_xmodem_receive
	__size_of_xmodem_receive	equ	__end_of_xmodem_receive-_xmodem_receive
	
_xmodem_receive:	
	opt	stack 13
; Regs used in _xmodem_receive: [wreg-status,0+pclath+cstack]
	line	66
	
l3711:	
;main.c: 65: char received;
;main.c: 66: unsigned char onContinue=0;
	clrf	(xmodem_receive@onContinue)
	line	74
	
l3713:	
;main.c: 67: char nBlock;
;main.c: 68: unsigned char loop;
;main.c: 69: char checksumRecu, checksumCalcule;
;main.c: 70: char data128;
;main.c: 74: onContinue = 20;
	movlw	(014h)
	movwf	(??_xmodem_receive+0)+0
	movf	(??_xmodem_receive+0)+0,w
	movwf	(xmodem_receive@onContinue)
	line	75
;main.c: 75: while(onContinue) {
	goto	l3737
	
l1179:	
	line	76
	
l3715:	
;main.c: 76: putc232(0x15);
	movlw	(015h)
	fcall	_putc232
	line	77
	
l3717:	
;main.c: 77: if (get232(2000, &received)) {
	movlw	low(07D0h)
	movwf	(?_get232)
	movlw	high(07D0h)
	movwf	((?_get232))+1
	movlw	(xmodem_receive@received)&0ffh
	movwf	(??_xmodem_receive+0)+0
	movf	(??_xmodem_receive+0)+0,w
	movwf	0+(?_get232)+02h
	fcall	_get232
	xorlw	0&0ffh
	skipnz
	goto	u2431
	goto	u2430
u2431:
	goto	l3727
u2430:
	line	78
	
l3719:	
;main.c: 78: if (received != 0x01) {
	movf	(xmodem_receive@received),w
	xorlw	01h&0ffh
	skipnz
	goto	u2441
	goto	u2440
u2441:
	goto	l1181
u2440:
	line	79
	
l3721:	
;main.c: 79: put232("xmodem error -> transfert abort\r\n");
	movlw	low(STR_1|8000h)
	movwf	(?_put232)
	movlw	high(STR_1|8000h)
	movwf	(?_put232+1)
	fcall	_put232
	goto	l1182
	line	80
	
l3723:	
;main.c: 80: return;
	goto	l1182
	line	81
	
l3725:	
;main.c: 81: } else {
	goto	l3737
	
l1181:	
	line	82
;main.c: 82: onContinue = 0;
	clrf	(xmodem_receive@onContinue)
	goto	l3737
	line	83
	
l1183:	
	line	84
;main.c: 83: }
;main.c: 84: } else {
	goto	l3737
	
l1180:	
	line	85
	
l3727:	
;main.c: 85: if (onContinue == 0) {
	movf	(xmodem_receive@onContinue),f
	skipz
	goto	u2451
	goto	u2450
u2451:
	goto	l3735
u2450:
	line	86
	
l3729:	
;main.c: 86: put232("xmodem timeout -> transfert abort\r\n");
	movlw	low(STR_2|8000h)
	movwf	(?_put232)
	movlw	high(STR_2|8000h)
	movwf	(?_put232+1)
	fcall	_put232
	goto	l1182
	line	87
	
l3731:	
;main.c: 87: return;
	goto	l1182
	line	88
	
l3733:	
;main.c: 88: } else {
	goto	l3737
	
l1185:	
	line	89
	
l3735:	
;main.c: 89: onContinue --;
	movlw	low(01h)
	subwf	(xmodem_receive@onContinue),f
	goto	l3737
	line	90
	
l1186:	
	goto	l3737
	line	91
	
l1184:	
	goto	l3737
	line	92
	
l1178:	
	line	75
	
l3737:	
	movf	(xmodem_receive@onContinue),f
	skipz
	goto	u2461
	goto	u2460
u2461:
	goto	l3715
u2460:
	goto	l3739
	
l1187:	
	line	94
	
l3739:	
;main.c: 90: }
;main.c: 91: }
;main.c: 92: }
;main.c: 94: onContinue = 1;
	clrf	(xmodem_receive@onContinue)
	bsf	status,0
	rlf	(xmodem_receive@onContinue),f
	line	95
;main.c: 95: while(onContinue) {
	goto	l3775
	
l1189:	
	line	96
	
l3741:	
;main.c: 96: get232(1000, &nBlock);
	movlw	low(03E8h)
	movwf	(?_get232)
	movlw	high(03E8h)
	movwf	((?_get232))+1
	movlw	(xmodem_receive@nBlock)&0ffh
	movwf	(??_xmodem_receive+0)+0
	movf	(??_xmodem_receive+0)+0,w
	movwf	0+(?_get232)+02h
	fcall	_get232
	line	97
;main.c: 97: get232(1000, &nBlock);
	movlw	low(03E8h)
	movwf	(?_get232)
	movlw	high(03E8h)
	movwf	((?_get232))+1
	movlw	(xmodem_receive@nBlock)&0ffh
	movwf	(??_xmodem_receive+0)+0
	movf	(??_xmodem_receive+0)+0,w
	movwf	0+(?_get232)+02h
	fcall	_get232
	line	99
	
l3743:	
;main.c: 99: checksumCalcule = 0;
	clrf	(xmodem_receive@checksumCalcule)
	line	100
	
l3745:	
;main.c: 100: for (loop=0; loop<128; loop++) {
	clrf	(xmodem_receive@loop)
	
l3747:	
	movlw	(080h)
	subwf	(xmodem_receive@loop),w
	skipc
	goto	u2471
	goto	u2470
u2471:
	goto	l3751
u2470:
	goto	l3759
	
l3749:	
	goto	l3759
	
l1190:	
	line	101
	
l3751:	
;main.c: 101: get232(1000, &test[loop >> 1]);
	movlw	low(03E8h)
	movwf	(?_get232)
	movlw	high(03E8h)
	movwf	((?_get232))+1
	movf	(xmodem_receive@loop),w
	lsrf	wreg,f
	addlw	_test&0ffh
	movwf	(??_xmodem_receive+0)+0
	movf	(??_xmodem_receive+0)+0,w
	movwf	0+(?_get232)+02h
	fcall	_get232
	line	102
	
l3753:	
;main.c: 102: checksumCalcule += test[loop >> 1];
	movf	(xmodem_receive@loop),w
	lsrf	wreg,f
	addlw	_test&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	indf1,w
	movwf	(??_xmodem_receive+0)+0
	movf	(??_xmodem_receive+0)+0,w
	addwf	(xmodem_receive@checksumCalcule),f
	line	100
	
l3755:	
	movlw	(01h)
	movwf	(??_xmodem_receive+0)+0
	movf	(??_xmodem_receive+0)+0,w
	addwf	(xmodem_receive@loop),f
	
l3757:	
	movlw	(080h)
	subwf	(xmodem_receive@loop),w
	skipc
	goto	u2481
	goto	u2480
u2481:
	goto	l3751
u2480:
	goto	l3759
	
l1191:	
	line	104
	
l3759:	
;main.c: 103: }
;main.c: 104: get232(1000, &checksumRecu);
	movlw	low(03E8h)
	movwf	(?_get232)
	movlw	high(03E8h)
	movwf	((?_get232))+1
	movlw	(xmodem_receive@checksumRecu)&0ffh
	movwf	(??_xmodem_receive+0)+0
	movf	(??_xmodem_receive+0)+0,w
	movwf	0+(?_get232)+02h
	fcall	_get232
	line	105
	
l3761:	
;main.c: 105: if (checksumCalcule == checksumRecu) {
	movf	(xmodem_receive@checksumCalcule),w
	xorwf	(xmodem_receive@checksumRecu),w
	skipz
	goto	u2491
	goto	u2490
u2491:
	goto	l3765
u2490:
	line	106
	
l3763:	
;main.c: 106: putc232(0x05);
	movlw	(05h)
	fcall	_putc232
	line	107
;main.c: 107: } else {
	goto	l3767
	
l1192:	
	line	109
	
l3765:	
;main.c: 109: putc232(0x05);
	movlw	(05h)
	fcall	_putc232
	goto	l3767
	line	110
	
l1193:	
	line	111
	
l3767:	
;main.c: 110: }
;main.c: 111: if (get232(1000, &received)) {
	movlw	low(03E8h)
	movwf	(?_get232)
	movlw	high(03E8h)
	movwf	((?_get232))+1
	movlw	(xmodem_receive@received)&0ffh
	movwf	(??_xmodem_receive+0)+0
	movf	(??_xmodem_receive+0)+0,w
	movwf	0+(?_get232)+02h
	fcall	_get232
	xorlw	0&0ffh
	skipnz
	goto	u2501
	goto	u2500
u2501:
	goto	l3775
u2500:
	line	112
	
l3769:	
;main.c: 112: if (received != 0x01) {
	movf	(xmodem_receive@received),w
	xorlw	01h&0ffh
	skipnz
	goto	u2511
	goto	u2510
u2511:
	goto	l3775
u2510:
	line	113
	
l3771:	
;main.c: 113: putc232(0x05);
	movlw	(05h)
	fcall	_putc232
	line	114
	
l3773:	
;main.c: 114: onContinue = 0;
	clrf	(xmodem_receive@onContinue)
	goto	l3775
	line	115
	
l1195:	
	goto	l3775
	line	116
	
l1194:	
	goto	l3775
	line	117
	
l1188:	
	line	95
	
l3775:	
	movf	(xmodem_receive@onContinue),f
	skipz
	goto	u2521
	goto	u2520
u2521:
	goto	l3741
u2520:
	goto	l3777
	
l1196:	
	line	118
	
l3777:	
;main.c: 115: }
;main.c: 116: }
;main.c: 117: }
;main.c: 118: put232(test);
	movlw	(_test&0ffh)
	movwf	(?_put232)
	movlw	0x0/2
	movwf	(?_put232+1)
	fcall	_put232
	line	119
	
l1182:	
	return
	opt stack 0
GLOBAL	__end_of_xmodem_receive
	__end_of_xmodem_receive:
;; =============== function _xmodem_receive ends ============

	signat	_xmodem_receive,88
	global	_put232
psect	text162,local,class=CODE,delta=2
global __ptext162
__ptext162:

;; *************** function _put232 *****************
;; Defined at:
;;		line 55 in file "C:\Users\dom\Dropbox\rpi yad\carte home automation\pic\bootloader\main.c"
;; Parameters:    Size  Location     Type
;;  pData           2    1[COMMON] PTR unsigned char 
;;		 -> STR_8(28), STR_7(23), STR_6(19), STR_5(23), 
;;		 -> STR_4(3), STR_3(58), test(64), STR_2(36), 
;;		 -> STR_1(34), 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         2       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_putc232
;; This function is called by:
;;		_xmodem_receive
;;		_main
;; This function uses a non-reentrant model
;;
psect	text162
	file	"C:\Users\dom\Dropbox\rpi yad\carte home automation\pic\bootloader\main.c"
	line	55
	global	__size_of_put232
	__size_of_put232	equ	__end_of_put232-_put232
	
_put232:	
	opt	stack 13
; Regs used in _put232: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	56
	
l3703:	
;main.c: 56: while(*pData != 0) {
	goto	l3709
	
l1173:	
	line	57
	
l3705:	
;main.c: 57: putc232(*pData);
	movf	(put232@pData),w
	movwf	fsr0l
	movf	((put232@pData+1)),w
	movwf	fsr0h
	movf	indf0,w ;code access
	fcall	_putc232
	line	58
	
l3707:	
;main.c: 58: pData++;
	movlw	low(01h)
	addwf	(put232@pData),f
	movlw	high(01h)
	addwfc	(put232@pData+1),f
	goto	l3709
	line	59
	
l1172:	
	line	56
	
l3709:	
	movf	(put232@pData),w
	movwf	fsr0l
	movf	((put232@pData+1)),w
	movwf	fsr0h
	movf	indf0,w ;code access
	iorlw	0
	skipz
	goto	u2421
	goto	u2420
u2421:
	goto	l3705
u2420:
	goto	l1175
	
l1174:	
	line	60
	
l1175:	
	return
	opt stack 0
GLOBAL	__end_of_put232
	__end_of_put232:
;; =============== function _put232 ends ============

	signat	_put232,4216
	global	_get232
psect	text163,local,class=CODE,delta=2
global __ptext163
__ptext163:

;; *************** function _get232 *****************
;; Defined at:
;;		line 32 in file "C:\Users\dom\Dropbox\rpi yad\carte home automation\pic\bootloader\main.c"
;; Parameters:    Size  Location     Type
;;  timeout         2    2[COMMON] unsigned short 
;;  pData           1    4[COMMON] PTR unsigned char 
;;		 -> main@received(1), xmodem_receive@checksumRecu(1), test(64), xmodem_receive@nBlock(1), 
;;		 -> xmodem_receive@received(1), 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr1l, fsr1h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         3       0       0
;;      Locals:         0       0       0
;;      Temps:          1       0       0
;;      Totals:         4       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_pause
;; This function is called by:
;;		_xmodem_receive
;;		_main
;; This function uses a non-reentrant model
;;
psect	text163
	file	"C:\Users\dom\Dropbox\rpi yad\carte home automation\pic\bootloader\main.c"
	line	32
	global	__size_of_get232
	__size_of_get232	equ	__end_of_get232-_get232
	
_get232:	
	opt	stack 13
; Regs used in _get232: [wreg+fsr1l-status,0+pclath+cstack]
	line	33
	
l3681:	
;main.c: 33: if (timeout > 0) {
	movf	(get232@timeout+1),w
	iorwf	(get232@timeout),w
	skipnz
	goto	u2371
	goto	u2370
u2371:
	goto	l1158
u2370:
	goto	l3687
	line	34
	
l3683:	
;main.c: 34: while((RCIF == 0) && (timeout--)) {
	goto	l3687
	
l1153:	
	line	35
	
l3685:	
;main.c: 35: pause();
	fcall	_pause
	goto	l3687
	line	36
	
l1152:	
	line	34
	
l3687:	
	movlb 0	; select bank0
	btfsc	(141/8),(141)&7
	goto	u2381
	goto	u2380
u2381:
	goto	l1157
u2380:
	
l3689:	
	movlw	low(01h)
	subwf	(get232@timeout),f
	movlw	high(01h)
	subwfb	(get232@timeout+1),f
	movlw	high(0FFFFh)
	xorwf	((get232@timeout+1)),w
	skipz
	goto	u2395
	movlw	low(0FFFFh)
	xorwf	((get232@timeout)),w
u2395:

	skipz
	goto	u2391
	goto	u2390
u2391:
	goto	l3685
u2390:
	goto	l1157
	
l1155:	
	goto	l1157
	
l1156:	
	line	37
;main.c: 36: }
;main.c: 37: } else {
	goto	l1157
	
l1151:	
	line	38
;main.c: 38: while(RCIF == 0);
	goto	l1158
	
l1159:	
	
l1158:	
	movlb 0	; select bank0
	btfss	(141/8),(141)&7
	goto	u2401
	goto	u2400
u2401:
	goto	l1158
u2400:
	goto	l1157
	
l1160:	
	line	39
	
l1157:	
	line	40
;main.c: 39: }
;main.c: 40: if (RCIF ==0) {
	btfsc	(141/8),(141)&7
	goto	u2411
	goto	u2410
u2411:
	goto	l3697
u2410:
	line	41
	
l3691:	
;main.c: 41: return 0;
	movlw	(0)
	goto	l1162
	
l3693:	
	goto	l1162
	line	42
	
l3695:	
;main.c: 42: } else {
	goto	l1162
	
l1161:	
	line	43
	
l3697:	
;main.c: 43: *pData = RCREG;
	movlb 3	; select bank3
	movf	(409)^0180h,w	;volatile
	movwf	(??_get232+0)+0
	movf	(get232@pData),w
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(??_get232+0)+0,w
	movwf	indf1
	line	44
	
l3699:	
;main.c: 44: return 1;
	movlw	(01h)
	goto	l1162
	
l3701:	
	goto	l1162
	line	45
	
l1163:	
	line	46
	
l1162:	
	return
	opt stack 0
GLOBAL	__end_of_get232
	__end_of_get232:
;; =============== function _get232 ends ============

	signat	_get232,8313
	global	_putc232
psect	text164,local,class=CODE,delta=2
global __ptext164
__ptext164:

;; *************** function _putc232 *****************
;; Defined at:
;;		line 49 in file "C:\Users\dom\Dropbox\rpi yad\carte home automation\pic\bootloader\main.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1    0[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_put232
;;		_xmodem_receive
;;		_main
;; This function uses a non-reentrant model
;;
psect	text164
	file	"C:\Users\dom\Dropbox\rpi yad\carte home automation\pic\bootloader\main.c"
	line	49
	global	__size_of_putc232
	__size_of_putc232	equ	__end_of_putc232-_putc232
	
_putc232:	
	opt	stack 13
; Regs used in _putc232: [wreg]
;putc232@data stored from wreg
	movwf	(putc232@data)
	line	50
	
l3677:	
;main.c: 50: while(TXIF == 0);
	goto	l1166
	
l1167:	
	
l1166:	
	movlb 0	; select bank0
	btfss	(140/8),(140)&7
	goto	u2361
	goto	u2360
u2361:
	goto	l1166
u2360:
	goto	l3679
	
l1168:	
	line	51
	
l3679:	
;main.c: 51: TXREG = data;
	movf	(putc232@data),w
	movlb 3	; select bank3
	movwf	(410)^0180h	;volatile
	line	52
	
l1169:	
	return
	opt stack 0
GLOBAL	__end_of_putc232
	__end_of_putc232:
;; =============== function _putc232 ends ============

	signat	_putc232,4216
	global	_pause
psect	text165,local,class=CODE,delta=2
global __ptext165
__ptext165:

;; *************** function _pause *****************
;; Defined at:
;;		line 26 in file "C:\Users\dom\Dropbox\rpi yad\carte home automation\pic\bootloader\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  tempo           2    0[COMMON] volatile unsigned short 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         2       0       0
;;      Temps:          0       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_get232
;; This function uses a non-reentrant model
;;
psect	text165
	file	"C:\Users\dom\Dropbox\rpi yad\carte home automation\pic\bootloader\main.c"
	line	26
	global	__size_of_pause
	__size_of_pause	equ	__end_of_pause-_pause
	
_pause:	
	opt	stack 13
; Regs used in _pause: [wreg]
	line	28
	
l3673:	
;main.c: 27: volatile unsigned short tempo;
;main.c: 28: tempo = 5;
	movlw	low(05h)
	movwf	(pause@tempo)	;volatile
	movlw	high(05h)
	movwf	((pause@tempo))+1	;volatile
	line	29
;main.c: 29: while(tempo--);
	goto	l3675
	
l1146:	
	goto	l3675
	
l1145:	
	
l3675:	
	movlw	low(01h)
	subwf	(pause@tempo),f	;volatile
	movlw	high(01h)
	subwfb	(pause@tempo+1),f	;volatile
	movlw	high(0FFFFh)
	xorwf	((pause@tempo+1)),w	;volatile
	skipz
	goto	u2355
	movlw	low(0FFFFh)
	xorwf	((pause@tempo)),w	;volatile
u2355:

	skipz
	goto	u2351
	goto	u2350
u2351:
	goto	l3675
u2350:
	goto	l1148
	
l1147:	
	line	30
	
l1148:	
	return
	opt stack 0
GLOBAL	__end_of_pause
	__end_of_pause:
;; =============== function _pause ends ============

	signat	_pause,88
psect	text166,local,class=CODE,delta=2
global __ptext166
__ptext166:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
