#!/usr/bin/env python

import pexpect
import random
import subprocess
from sys import argv
from time import sleep

while True:
    # run the provided program (given as the first argument to autotester)
    proc = pexpect.spawn(argv[1])

    # send it some input!
    nums = []
    for i in range(3):
        num = random.randint(1, 10)
        nums.append(num)
        proc.sendline(str(num))

    # read all output produced by the program as a list of lines
    sleep(0.5)
    result = proc.readlines()
    numreturned = float(result[-1])

    # verify for lcm
    for num in nums:
        if num > numreturned:
            print "ERROR: generated a lcm smaller than an input!"
            exit(1)
        elif numreturned % num != 0:
            print "ERROR: not a multiple at all!"
            print " ".join([str(n) for n in nums])
            print "Result = " + str(numreturned)
            exit(1)

    print result
