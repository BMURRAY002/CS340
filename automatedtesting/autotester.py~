#!/usr/bin/env python

import pexpect
import random
import subprocess
from sys import argv
from time import sleep

# run the provided program (given as the first argument to autotester)
proc = pexpect.spawn(argv[1])

# send it some input!
proc.sendline("8")
proc.sendline("4")
proc.sendline("4")

# read all output produced by the program as a list of lines
sleep(0.5)
result = proc.readlines()

# TODO: verify the test case, and try another if it succeeds!
print result
