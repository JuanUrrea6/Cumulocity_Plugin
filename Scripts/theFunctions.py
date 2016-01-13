#! /usr/bin python3.4

%pylab inline

def divide(data,numDiv):
    length = len(data)
    slideThis = length/nums
    thePos = array([int(np.round(slideThis*i,0)) for i in range(numDiv)])
    return thePos

def createBell(data,slide,sigma):
    mean = 0
    theX = linspace(0,len(data),len(data))
    theBell = normpdf(theX-slide,mean,sigma)
    return theBell
