#! /usr/bin python3.4

#Import the necessary packages.
import sys
import numpy as np
import time
from scipy.fftpack import ifft, fft, fftfreq
import theFunctions as func

#Extract the data from the file input.
theReading = 0;
with open(sys.argv[1], 'r') as my_file:
    theReading = my_file.read()
newArray = theReading.split('\n')
#Only execute if the last data has a \n
del newArray[-1];
newArray = np.array(newArray);
newArray = [float(i) for i in newArray];

#newArray contains the input signal given by the user, defined by floats.
#Some useful info about it.
theLength = len(newArray);

#The user must decie the number of partitions in Gaussian bells that will be
#done to the data array, as well as the sigma for the bell.

numDiv = input("Number of partitions:");
theSigma = input("Sigma of Gaussian:");
numDiv = int(numDiv);
theSigma = float(theSigma);

#Slidings that must be done with the array and the bells.
thePos = func.divide(newArray,numDiv);
#Array that contains all the bell arrays.
theBells = [func.createBell(newArray, thePos[i],theSigma)*newArray for i in range(numDiv)];
