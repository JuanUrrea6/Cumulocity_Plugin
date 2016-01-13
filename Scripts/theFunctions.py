#! /usr/bin python3.4

import numpy as np
import scipy as sp
import matplotlib.mlab as mlab

def divide(data,numDiv):
    length = len(data)
    slideThis = length/numDiv
    thePos = np.array([int(np.round(slideThis*i,0)) for i in range(numDiv)])
    return thePos

def createBell(data,slide,sigma):
    mean = 0
    theX = np.linspace(0,len(data),len(data))
    theBell = mlab.normpdf(theX-slide,mean,sigma)
    return theBell

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
