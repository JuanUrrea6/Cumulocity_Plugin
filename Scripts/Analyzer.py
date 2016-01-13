#! /usr/bin python3.4

#Import the necessary packages.
import sys
import matplotlib
import numpy as np
import time
from scipy.fftpack import ifft, fft, fftfreq

#Extract the data from the file input.
theReading = 0;
with open(sys.argv[1], 'r') as my_file:
    theReading = my_file.read()
newArray = theReading.split('\n')
del newArray[-1]
newArray = np.array(newArray)
newArray = [float(i) for i in newArray]

#newArray contains the input signal given by the user, defined by floats.
#Some useful info about it.
theLength = len(newArray);

#Finding the X value corresponding to the Y maximum value.
#This function will allow the program to locate maximums.
def find_max(X,Y):
    the_max = max(Y)
    long = len(X)
    position = 0
    for i in range (long):
        actual_Y = Y[i]
        if (actual_Y == the_max):
            position = i
    answer = X[position]
    return abs(answer)
