import time
import serial
from time import sleep

def WaitFor(ser, s, timeOut):
        nbMax = 0
        ser.timeout = timeOut
        currentMsg = ''
        while currentMsg.endswith(s) != True :
            # should add a try catch here
            c=ser.read()
            if c != '' :
                currentMsg += c
            else :
                print 'timeout waiting for ' + s
                return False
            nbMax = nbMax + 1
            if nbMax > 1500:
		print 'bad bad bad'
		return False
        return True

print('Test de la carte RPIDOM\n') 

ser = serial.Serial(
	port='/dev/ttyAMA0',
	baudrate=1200,
	parity=serial.PARITY_EVEN,
	stopbits=serial.STOPBITS_ONE,
	bytesize=serial.SEVENBITS )


while 1:
	ser.write('A')

	if (WaitFor(ser, '/!\REPLACE/!\COUTERSERIAL1', 10)):
	  print('voie 1 OK') 
	else:
	  print('### voie 1 bof')
	  ser.close()
	  exit()

	ser.write('B')

	if (WaitFor(ser, '/!\REPLACE/!\COUTERSERIAL2', 10)):
	  print('voie 2 ok')
	else:
	  print('### voie 2 bof')
	  ser.close()
	  exit()

ser.close()




