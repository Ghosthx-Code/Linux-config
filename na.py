#!/usr/bin/env python3
import socket, os
# For custiom shell
while True:
    pwd = os.getcwd()
    if pwd == f"/home/{socket.gethostname()}":
        pwd = "~"
    user_input = input(f'{pwd} > ')