import time
import serial
from time import sleep

SOH = chr(0x01)
STX = chr(0x02)
EOT = chr(0x04)
ACK = chr(0x06)
NAK = chr(0x15)
CAN = chr(0x18)
CRC = chr(0x43)

def xmodem_send(serial, file):
	t, anim = 0, '|/-\\'
	serial.setTimeout(1)
	while 1:
	    if serial.read(1) != NAK:
        	t = t + 1
	        print anim[t%len(anim)],'\r',
        	if t == 60 : return False
	    else:
        	break

	p = 1
	s = file.read(128)
	while s:
	    s = s + '\xFF'*(128 - len(s))
	    chk = 0
	    for c in s:
        	chk+=ord(c)
	    while 1:
        	serial.write(SOH)
	        serial.write(chr(p))
        	serial.write(chr(255 - p))
	        serial.write(s)
        	serial.write(chr(chk%256))
	        serial.flush()

        	answer = serial.read(1)
	        if  answer == NAK: continue
        	if  answer == ACK: break
	        return False
	    s = file.read(128)
	    p = (p + 1)%256
	    print '.',
	serial.write(EOT)
	return True

def getc(size, timeout=1):
    return ser.read(size)

def putc(data, timeout=1):
    ser.write(data)
    sleep(0.001) # give device time to prepare new buffer and start sending it

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
            if nbMax > 150:
		print 'bad bad bad'
		return False
        return True

print('Mise a jour de la carte RPIDOM\n')

ser = serial.Serial(
	port='/dev/ttyAMA0',
	baudrate=1200,
	parity=serial.PARITY_EVEN,
	stopbits=serial.STOPBITS_ONE,
	bytesize=serial.SEVENBITS
)

ser.open()
ser.write('Y')
sleep(0.1) # give device time to prepare new buffer and start sending it
ser.write('A')
sleep(0.1) # give device time to prepare new buffer and start sending it
ser.write('D')
sleep(0.1) # give device time to prepare new buffer and start sending it
ser.close()

ser = serial.Serial(
        port='/dev/ttyAMA0',
        baudrate=115200,
        parity=serial.PARITY_NONE,
        stopbits=serial.STOPBITS_ONE,
        bytesize=serial.EIGHTBITS
)
ser.open()

if (WaitFor(ser, 'yad', 10)):
  print('youpi')
else:
  print('bof')
  ser.close()
  exit()

ser.write('y')
sleep(0.1) # give device time to prepare new buffer and start sending it
ser.write('a')
sleep(0.1) # give device time to prepare new buffer and start sending it
ser.write('d')
sleep(0.1) # give device time to prepare new buffer and start sending it

if (WaitFor(ser, 'transfert', 10)):
  print('youpi')
else:
  print('bof')
  ser.close()
  exit()

stream = open('appli.hex','r')
xmodem_send(ser, stream)



ser.close()
