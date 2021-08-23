#include <htc.h>

// voir pour faire clignoter la led en mode bootloader...
// connexion pickit3 ?


// mettre à 1 si carte proto, 0 sinon
#define MODE_PROTO	0

// sélectionne l'oscillateur interne, 
//__CONFIG(FOSC_INTOSC & CLKOUTEN_ON);   
__CONFIG(FOSC_INTOSC & WDTE_OFF & MCLRE_ON);   
// autorise l'écriture en flash, sauf la zone de boot, et la programmation basse tension 
//__CONFIG(WRT_BOOT & LVP_ON);
__CONFIG(WRT_OFF & LVP_OFF);

#define ADDRESSE_APPLI			0x500
#define ADDRESSE_INTERRUPT		ADDRESSE_APPLI + 0x4
#define VALEUR_OCTET_START	'D'

#define TELEINFO1_PIN_NUMBER 2

#define SOH		0x01
#define EOT		0x04
#define ACK		0x06
#define NAK		0x15

unsigned char received;
unsigned char retourXReceive;

void interrupt interruptFct(void)
{

#if 1
	#asm
		goto ADDRESSE_INTERRUPT
	#endasm
#else
/*	if((OERR) || (FERR))  {
	  received = RCREG;        // Waste RCREG (clears condition)
	CREN = 0;
      OERR = 0;          // Clear errors
      FERR = 0;
      CREN = 1;          // Enable receiver 
	 TXREG = 'A';
	}	*/
	if (RCIF) {
		received = FERR;
		received = RCREG;
		received++;
		TXREG = cpt++;
		FERR = 0;
	}
	if (IOCAF & (1 << TELEINFO1_PIN_NUMBER))  {
/*		if (PORTA & (1 << TELEINFO1_PIN_NUMBER)) {
			RA4 = 1;
		} else {
			RA4 = 0;
		}			
*/
		IOCAF &=  (~(1 << TELEINFO1_PIN_NUMBER));
	}
#endif

}

char get232(char* pData) {
	unsigned int timeout = 65000;
	while((RCIF == 0) && (timeout--)) {
	}
	if (RCIF ==0) {
		return 0;
	} else {
		*pData = RCREG;
		return 1;
	}
}                

void putc232(char data)
{ 
	while(TXIF == 0);  
	TXREG = data;      
}                  

void put232(char* pData)
{ 
	while(*pData != 0) {
		putc232(*pData);
		pData++;
	}
}                  

unsigned char hexToInt(unsigned char hexC)  {
	unsigned char retour;
	if (hexC <= '9') {
		retour = hexC - '0';
	} else {
		retour = hexC - 'A' + 10;
	}	
	return retour;
}

#define WF_START_CODE				0
#define WF_BYTE_COUNT				1
#define WF_ADDRESS					2
#define WF_RECORD_TYPE				3
#define WF_DATA1					4
#define WF_DATA2					5
#define WF_DATA3					6
#define WF_DATA4					7
#define WF_CHECKSUM					8

unsigned int address;
unsigned char nbToReceive, recordType;
unsigned char state=WF_START_CODE;
unsigned char cptInterne;
unsigned int iData;
unsigned char data =0;

unsigned char counter=0;

#define NB_DATA_MAX	26
unsigned int iTabData[NB_DATA_MAX];
unsigned int iAdresseBase=0;
unsigned char nbData=0;

void goFlashage() {
	unsigned char index;

	// charge les données dans leslatch d'écriture
	for (index=0; index<nbData; index++) {
		EEADR = iAdresseBase+index;
		EEDAT = iTabData[index];
		EECON2=0x55;		// ces 2 valeurs doivent être écrites dans EECON2 pour
		EECON2=0xAA;		// valider l'écriture dans la mémoire flash
		WR = 1;
	#asm
		nop
		nop
	#endasm

		if (((iAdresseBase+index) & 0xF) == 0xf) {
			// on est à la fin d'un secteur de flash -> on lance l'écriture du secteur
			LWLO = 0;
			EEDAT = iTabData[index];
			EECON2=0x55;		// ces 2 valeurs doivent être écrites dans EECON2 pour
			EECON2=0xAA;		// valider l'écriture dans la mémoire flash
			WR = 1;
				
			#asm
				nop
				nop
			#endasm
			
			WREN = 0;								
			EEPGD = 1;
			WREN = 1;
			CFGS = 0;
			LWLO = 1;
		}
	}
	iAdresseBase += nbData;
	nbData = 0;

}



unsigned char decodeHexFile(char newChar) {
	unsigned char retour = 0;

	switch(state) {
		case 0:		// on attend le premier caractère d'une ligne : ':'
			if (newChar == ':') {
				state = WF_BYTE_COUNT;
				cptInterne = 0;
				nbToReceive = 0;
				counter++;
			}
			break;
		case WF_BYTE_COUNT:
			nbToReceive = (nbToReceive  << 4) + hexToInt(newChar) ;
			if (cptInterne++ > 0) {
				state = WF_ADDRESS;
				cptInterne = 0;
				address = 0;	
			}
			break; 
		case WF_ADDRESS:
			address = ((address  << 4) + hexToInt(newChar))  ;
			if (cptInterne++ > 2) {
				state = WF_RECORD_TYPE;
				cptInterne = 0;
				address /= 2;
				if (address == 0) {
					state = 0;		// permet de sauter la première ligne qui ne contient pas de données
				} else {
					if (iAdresseBase == 0) {
						iAdresseBase = address;
					}
				}
			}
			break; 
		case WF_RECORD_TYPE:
			recordType = (recordType << 4) + hexToInt(newChar) ;
			if (cptInterne++ > 0) {
				if (recordType == 1) {
					// fin du fichier atteinte 
					get232(&data);		// lit les 2 derniers caractères de la ligne
					get232(&data);
					get232(&data);
					state = 0;
					retour = 1;
					retourXReceive = 1;
				} else {
					state = WF_DATA1;
					cptInterne = 0;
				}	
			}
			break; 

		case WF_DATA1:
			iData = hexToInt(newChar) << 4;
			state = WF_DATA2;
			break;
		case WF_DATA2:
			iData = iData + hexToInt(newChar);
			state = WF_DATA3;
			break;
		case WF_DATA3:
			iData = iData + (hexToInt(newChar) << 12);
			state = WF_DATA4;
			break;

		case WF_DATA4:
			iData = iData + (hexToInt(newChar) << 8) ;
			cptInterne++;
			if (nbData < (NB_DATA_MAX - 1)) {
				iTabData[nbData] = iData;
				nbData++;	
/*			} else {
				iData = 0;		// pour mettre un point d'arrêt*/
			}
			if (cptInterne < (nbToReceive/2)) {
				state = WF_DATA1;
			} else {
				// réception des données terminée
				state = WF_CHECKSUM;
				cptInterne = 0;
			}
			break; 
		case WF_CHECKSUM:
			if (cptInterne++ > 0) {
				state = 0;
			}
			break; 

		}	
	return retour;	
}


#if 1
void xmodem_receive() {
	unsigned char onContinue=0;
	unsigned char loop;
	unsigned int index=0;

	state = 0;

	// effacement de la flash
	for (index=ADDRESSE_APPLI; index<0x7FF; index+=16) {
		EEADR = index;
		CFGS = 0;
		EEPGD = 1;
		FREE = 1;
		WREN = 1;
		EECON2=0x55;		// ces 2 valeurs doivent être écrites dans EECON2 pour
		EECON2=0xAA;		// valider l'écriture dans la mémoire flash
		WR = 1;
		#asm
			nop
			nop
		#endasm
		while(WR);	
	}

	// prépare la flash pour l'écriture
	EEPGD = 1;
	WREN = 1;
	CFGS = 0;
	LWLO = 1;

	// envoi des <nak> jusqu'à la réception d'une réponse qui doit être 0x01
	onContinue = 60;
	while(onContinue) {	 
		state=WF_START_CODE;
		LATA5 = ~RA5;
		putc232(NAK);	// envoi un nak
		while(TXIF == 0);  
		if (get232(&received)) {
			if (received == SOH) {
				onContinue = 0;
			}
		} else {
			if (get232(&received)) {
				if (received == SOH) {
					onContinue = 0;
				}
			}
		}
	}



	LATA5 = 1;
	onContinue = 1;
	while(onContinue) {	
		get232(&loop);
		get232(&loop);
	
		for (loop=0; loop<128; loop++) {
			if (get232(&received) > 0) {
				if (decodeHexFile(received) != 0) {
					onContinue = 0;
				}
			}
		}
		get232(&loop);

		// on a du temps ici, on va donc lancer le flashage des données reçues
		goFlashage();
		
		putc232(ACK);	// envoi un nak
		if (get232(&received)) {
			if (received != SOH) {
				onContinue = 0;	
 				putc232(ACK);	// envoi un ack
				retourXReceive = 1;
			}
		}
	}
}
#endif


char litOctetStart() {
	EEADRL = 0;
	EEPGD = 0;
	CFGS = 0;
	RD = 1;
	return EEDATL;
}

/*
void ecritOctetStart() {
	EEADRL = 0;
	EEDATL = 'D';

	WREN = 1;

	EECON2=0x55;		// ces 2 valeurs doivent être écrites dans EECON2 pour
	EECON2=0xAA;		// valider l'écriture dans la mémoire flash
	WR = 1;
	#asm
		nop
		nop
	#endasm
}*/



void main()
{ 
	unsigned int i;
	unsigned int tempoBoot=0;
	unsigned char secuUpdate = 0;

	PEIE = 0;
	GIE = 0;

	retourXReceive=0;
	data =0;
	counter=0;
	iAdresseBase=0;
	nbData=0;

	ANSELA = 0;                // make pins digital
     TRISA = 0;        // porta all outputs
//     PORTA = 0;                 // all output latches low
     OSCCON = 0b11110000;       // initialize 32-MHz INTOSC
     while(!HFIOFS);    // wait until OSC stable

	PEIE = 0;
	GIE = 0;

	SPEN = 0;
	CREN = 0;
	TXEN = 0;

#if MODE_PROTO
	 // configuration pour mettre au point le bootloader
     TRISA5 = 1;   	 // RA5(RX) inputs
     RXDTSEL = 1;        // RX/DT function on RA5
     TXCKSEL = 1;        // TX/CK function on RA4
#else
/* configuration finale */
	// RA5 = sortie led
	// RA4 entrée téléinfo 
	// RA3 : pin du RPI
	// RA2 entrée téléinfo
	// RA1 / RA0 : rs232
     TRISA1 = 1;   	 // RA5(RX) inputs
     RXDTSEL = 0;        // RX/DT function on RA1
     TXCKSEL = 0;        // TX/CK function on RA0
#endif


    /*                                                              *
     *  setup serial port for 115200 baud (32 MHz clock)               *
     *                                                              */

     SPBRG = 16;        // 115200 baud
     BRG16 = 0;         // use 8-bit brg clock

	SPEN = 1;
	CREN = 1;
	TXEN = 1;
	BRGH = 1;	
	SYNC = 0;

	//ecritOctetStart();
	received = litOctetStart();
	if (received == VALEUR_OCTET_START	) {
#asm
		goto ADDRESSE_APPLI
#endasm		
	}

	i = 0;
	while(i<65000) {
		LATA5 = ~RA5;
		put232((char*)"Enter yad to update the firmware\r\n");	
		if (get232(&received)) {
			if (((secuUpdate==0) && (received == 'y')) 
				|| ((secuUpdate==1) && (received == 'a')) 
				|| ((secuUpdate==2) && (received == 'd')) 
/*				|| ((secuUpdate==3) && (received == 'o')) 
				|| ((secuUpdate==4) && (received == 'm')) */
				) {
				secuUpdate++;
				if (secuUpdate > 2) {
					put232((char*)"Waiting for xmodem transfert\r\n");	
					xmodem_receive();
					tempoBoot = 501;		
				}
			} else {
				secuUpdate = 0;
			}
			TXREG = received;
		} else {
			tempoBoot++;
		}
		if (tempoBoot > 500) {
			put232((char*)"timeout\r\n");	
			CREN = 0;
#asm
			goto ADDRESSE_APPLI
#endasm		

		}
	}

 	

 	

	// tempo permettant à minicom d'effacer la fenêtre d'envoi xmodem	
	for (i=0; i< 65000; i++);
//			put232((char*)"\nProgrammation OK, please configure serial port in 1200bds 7E1\n");
	put232((char*)"\nBye\n");

	RA5 = 0;
#asm
	goto ADDRESSE_APPLI
#endasm		
}