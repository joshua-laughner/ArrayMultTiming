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
    c = np.zeros_like(a)
    t1 = time.time()
    for i in range(len(a)):
        c[i] = a[i] * b[i]

    t2 = time.time()
    dt = 1000*(t2 - t1)
    print('   * Time = {:.4f} ms'.format(dt))
    return dt


def timeme3(a,b):
    t1 = time.time()
    c = a * b
    t2 = time.time()
    dt = 1000*(t2-t1)
    print('   * Time = {:.4f} ms'.format(dt))
    return dt

"""
alpha = list(range(int(1e8)))
beta = list(range(int(1e8)))
for i in range(3):
    timeme(alpha, beta)
"""

alpha = np.arange(1e8)
beta = np.arange(1e8)

n = 1
ttot = 0.0
for i in range(n):
    print('Test {}/{} with for loop:'.format(i+1,n))
    ttot += timeme2(alpha,beta)
print('Mean overall time = {} ms'.format(ttot / n))


print('')
n = 5
ttot = 0.0
for i in range(n):
    print('Test {}/{} with numpy multiplication:'.format(i+1,n))
    ttot += timeme3(alpha,beta)
print('Mean overall time = {} ms'.format(ttot / n))