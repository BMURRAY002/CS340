#!/usr/bin/env python

import pexpect
import random
import subprocess
from sys import argv
from time import sleep

while True:
    # run the provided program (given as the first argument to autotester)
    proc = pexpect.spawn(argv[1])

    # use the number of inputs provided, or just assume 3
    numinputs = 3 if len(argv) == 2 else int(argv[2])

    # send it some input!
    nums = []
    for i in range(numinputs):
        num = random.randint(1, 10)
        nums.append(num)
        proc.sendline(str(num))
    proc.sendline("-1")

    # read all output produced by the program as a list of lines
    sleep(0.5)
    result = proc.readlines()
    numreturned = float(result[-1])

    # verify for avg
    #if abs(sum(nums) / 3.0 - numreturned) > 0.001:
    if abs(sum(nums) * 1.0 / len(nums) - numreturned) > 0.001:
        print "ERROR: no good!"
        print " ".join([str(n) for n in nums])
        print "Result = " + str(numreturned)
        exit(1)

    print result
