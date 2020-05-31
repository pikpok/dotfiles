#!/usr/bin/env python3

#
# This script prints the battery charge level of some bluetooth headsets
#
import socket, sys, json, time, dbus

def send(sock, message):
    #print('>>> ' + message.decode())
    sock.send(b"\r\n" + message + b"\r\n")

def getATCommand(sock, line):
    #print('<<< ' + line.decode())
    if b"BRSF" in line:
        send(sock, b"+BRSF:20")
        send(sock, b"OK")
    elif b"CIND=" in line:
        send(sock, b"+CIND: (\"battchg\",(0-5))")
        send(sock, b"OK")
    elif b"CIND?" in line:
        send(sock, b"+CIND: 5")
        send(sock, b"OK")
    elif b"IPHONEACCEV" in line:
        if not b',' in line:
            return True

        parts = line[line.index(b',') + 1 : -1].split(b',')
        if len(parts) < 1 or (len(parts) % 2) != 0:
            return True

        i = 0
        while i < len(parts):
            key = int(parts[i])
            val = int(parts[i + 1])

            if key == 1:
                blevel = (val + 1) * 10
                output = {'text': "{}%".format(blevel)}
                sys.stdout.write(json.dumps(output) + '\n')
                sys.stdout.flush()
                return False
            i += 2
    else:
        send(sock, b"OK")
    return True

def main(s):
    try:
        while getATCommand(s, s.recv(128)):
            pass
    except:
        print(sys.exc_info()[0])
        time.sleep(1)

def getSocket(address):
    # hack, but works for me (different devices needed different ports?)
    for port in range(1, 100):
        try:
            s = socket.socket(socket.AF_BLUETOOTH, socket.SOCK_STREAM, socket.BTPROTO_RFCOMM)
            s.connect((address, port))
            return s
        except:
            s.shutdown(socket.SHUT_RDWR)
    return 0

def getBluetoothAddress():
    bus = dbus.SystemBus()
    objects = dbus.Interface(bus.get_object('org.bluez', "/"), 'org.freedesktop.DBus.ObjectManager').GetManagedObjects()

    for path, ifaces in objects.items():
        for x, y in ifaces.items():
            if x == 'org.bluez.Device1':
                if y.get('Connected'):
                    return y.get('Address')

    return 0

if __name__ == "__main__":
    while True:
        address = getBluetoothAddress()
        print(address)

        if address:
            sock = getSocket(address)
            if (sock):
                main(sock)
                sock.shutdown(socket.SHUT_RDWR)
        else:
            sys.stdout.write('\n')
            sys.stdout.flush()
        time.sleep(10)

