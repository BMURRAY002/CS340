#!/usr/bin/env python

import pexpect
import random
import subprocess
from sys import argv
from time import sleep

# run the provided program (given as the first argument to autotester)
proc = pexpect.spawn(argv[1])

# send it some input!
while True:
    nums = []
    numinpts = random.randint(1,5)
    for i in range(3):
        num = rand.randint(1,10)
        proc.sendline(str(num))
        nums.append(num)
    proc.sendline("-1")

# read all output produced by the program as a list of lines
sleep(0.5)
result = proc.readlines()
numreturned = float(result[-1])

# TODO: verify the test case, and try another if it succeeds!
if (sum(nums) / 3.0 - numreturned) >= 0.001:
            print "ERROR: wrong result!"
            print " ".join([str(n) for n in nums])
            print "Result = " + str(numreturned)
            exit(1)
print result
