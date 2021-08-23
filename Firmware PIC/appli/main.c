#include <htc.h>


#define VALEUR_OCTET_START	'D'

#define TELEINFO1_PIN_NUMBER 2
#define TELEINFO2_PIN_NUMBER 4

unsigned long compteur;

unsigned char voieActive = 0;
unsigned char received;

unsigned char cptReboot;


void rebootEnBootloader();

char cmd_reboot[] = "YADOM";

void interrupt interruptFct(void) {

	LATA5 = ~RA5;
	if (RCIF) {
		if ((!OERR) && (!FERR)) {
			received = RCREG & 0x7F;
			if (received == 0x61)  {		// 'a'
				voieActive = 0;
			} 
			if (received == 0x62)  {		// 'b'
				voieActive = 1;
			}
	
			// il faut taper YAD pour faire rebooter
			if (cptReboot < 5) {
				if (received == cmd_reboot[cptReboot])  {
					cptReboot++;	
				} else {
					cptReboot = 0;
				}
				if (cptReboot >= 3) {
					rebootEnBootloader();
				}
			} else {
				cptReboot = 0;
			}
		}
	}
//	if (IOCAF & (1 << TELEINFO2_PIN_NUMBER))  {
	if (IOCAF4)  {
		received = PORTA;
		if (voieActive == 1) {	
			if (RA4) {
				LATA0 = 1;
			} else {
				LATA0 = 0;
			}			
		}
		IOCAF4 = 0;
	}
//	if (IOCAF & (1 << TELEINFO1_PIN_NUMBER))  {
	if (IOCAF2)  {
		received = PORTA;
		if (voieActive == 0) {	
			if (RA2) {
				LATA0 = 1;
			} else {
				LATA0 = 0;
			}			
		}
		IOCAF2 = 0;
	}


}

void ecritOctetStart(unsigned char valeur) {
	EEADRL = 0;
	EEDATL = valeur;

	WREN = 1;

	EECON2=0x55;		// ces 2 valeurs doivent être écrites dans EECON2 pour
	EECON2=0xAA;		// valider l'écriture dans la mémoire flash
	WR = 1;
	#asm
		nop
		nop
	#endasm
}

char litOctetStart() {
	EEADRL = 0;
	EEPGD = 0;
	CFGS = 0;
	RD = 1;
	return EEDATL;
}


void rebootEnBootloader() {
	GIE = 0;
	PEIE = 0;

	ecritOctetStart('V');
	#asm
		goto 0
	#endasm
}

void main() {
	unsigned long i;
	unsigned char commande;
	unsigned char reponse = 'a';

	cptReboot = 0;
    /*                                                              *
     *  setup serial port for 1200 baud (32 MHz clock)               *
     *                                                              */
	SSPEN = 0;
	CREN = 0;
	TXEN = 0;
	BRGH = 0;
    BRG16 = 1;         // use 16-bit brg clock
    SPBRGL = 1666 & 0xFF;        // 115200 baud
    SPBRGH = 1666 >> 8;        // 115200 baud
	SPEN = 1;
	CREN = 1;
	TXEN = 0;	// pas de transmission rs232 via l'uart

    TXCKSEL = 0;        // TX sur RA0
	RXDTSEL = 0;		// RX sur RA1
	T1GSEL = 1;
	SDOSEL = 0;
	TRISA0 = 0;			// configure la RA0 en sortie (TX)
	TRISA5 = 0;			// configure la RA5 en sortie (LED)

	// Entrée teleinfo1
	TRISA |= (1 << TELEINFO1_PIN_NUMBER);   	 // pin en entrée
	WPUA |= (1 << TELEINFO1_PIN_NUMBER); 		 // pull-up interne activé
	// Entrée teleinfo2
	TRISA |= (1 << TELEINFO2_PIN_NUMBER);   	 // pin en entrée
	WPUA |= (1 << TELEINFO2_PIN_NUMBER); 		 // pull-up interne activé
	OPTION_REG &= 0x7F;							// active les pullup activable individuellement

	// interrut on change
	IOCAN = 0;
	IOCAP = 0;
	IOCAN |= 1 << TELEINFO1_PIN_NUMBER;			// interruotion sur front descendant
	IOCAP |= 1 << TELEINFO1_PIN_NUMBER;			// interruotion sur front montant
	IOCAN |= 1 << TELEINFO2_PIN_NUMBER;			// interruotion sur front descendant
	IOCAP |= 1 << TELEINFO2_PIN_NUMBER;			// interruotion sur front montant*/
	IOCIE = 1;

	received = PORTA;
	IOCAF = 0;

	RCIE = 1;
	PEIE = 1;
	GIE = 1;


	if (litOctetStart() != VALEUR_OCTET_START) {
		ecritOctetStart(VALEUR_OCTET_START);
	}

	while(1) {
	}
}