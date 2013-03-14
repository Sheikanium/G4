#!/usr/bin/expect -f

set timeout -1

set username "user"
set password "password"
set hostname "ip"

spawn ssh -l $username $hostname
expect "continue ?"
	send -- "yes\r"
expect "assword"
	send -- "$password\r"
expect "~$"
	send -- "mkdir camarche\r"
	send -- "exit\r"
