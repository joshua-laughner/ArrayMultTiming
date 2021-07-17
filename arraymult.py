# Run with: python arraymult.py
# Uses Python3, required numpy be installed
import numpy as np
import time

def timeme(a,b):
    t1 = time.time()
    c = [x*y for x,y in zip(a,b)]
    t2 = time.time()
    print('Time with list comprehension = {} s'.format(t2-t1))


def timeme2(a,b):
    c = [0 for x in a]
    t1 = time.time()
    for i in range(len(a)):
        c[i] = a[i] * b[i]

    t2 = time.time()
    print('Time with for loop & preallocation = {} s'.format(t2-t1))


def timeme3(a,b):
    t1 = time.time()
    c = a * b
    t2 = time.time()
    print('Time with numpy arrays = {} s'.format(t2-t1))


"""
alpha = list(range(int(1e8)))
beta = list(range(int(1e8)))
for i in range(3):
    timeme(alpha, beta)

print('')
for i in range(3):
    timeme2(alpha,beta)


print('')
alpha = np.array(alpha)
beta = np.array(beta)
"""
alpha = np.arange(1e8)
beta = np.arange(1e8)
for i in range(3):
    timeme3(alpha,beta)
