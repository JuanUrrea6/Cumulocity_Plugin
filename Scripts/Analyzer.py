#! /usr/bin python3.4

#Import the necessary packages.
import sys
import numpy as np
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
print("Gaussian Parameters:");
numDiv = input("Number of partitions:");
theSigma = input("Sigma of Gaussian:");
print("Fourier Analysis Parameters:");
dt = input("Time Differential (dt)");

#Convert all inputs to acceptable formats.
dt = float(dt);
numDiv = int(numDiv);
theSigma = float(theSigma);

#Slidings that must be done with the array and the bells.
thePos = func.divide(newArray,numDiv);
#Array that contains all the bell arrays.
theBells = np.array([func.createBell(newArray, thePos[i],theSigma)*newArray for i in range(numDiv)]);
#All the fourier results in magnitude.
theFouriers = np.array([func.findFourier(theBells[i],dt) for i in range(numDiv)]);
theMain = np.array([func.find_max(theFouriers[i][1],theFouriers[i][0]) for i in range(numDiv)]);
