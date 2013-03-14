#!/usr/bin/expect -f

set username "sheik"
set password "adsfdgfhg"
set hostname "90.16.108.214"

spawn ssh -l $username $hostname
expect "continue ?"
	send -- "yes\r"
expect "assword"
	send -- "$password\r"
expect "~$"
	send -- "mkdir camarche\r"
	send -- "exit\r"
