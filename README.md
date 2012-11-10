DEVELOPER CODING EXERCISE
=========================

Model an Elevator System
------------------------

Features:
 1.  Each elevator should be able to report what floor it is on, whether it
     is moving, and what floor it is going to next.
     It should also report what floors passengers have requested.
     NOTE: This information is accesible directly from properties:

    elevator.currentFloor;
    elevator.isMoving;
    elevator.destinationFloor;
    elevator.floorRequests;
    
 2.  The Elevator System should be able to accept a service request from
     any floor, and select only one elevator to respond to it.
     The selection algorithm should be reasonable.
 3.  Each elevator should be able to respond to a service request from a
     floor (via #2) and move towards that floor.
     NOTE: Because physical implementation of this system would take time 
     for elevators to move from one floor to the other, I invision the coded
     implementation using a step system where elevators spend 1 step per 
     floor and 0 steps to load and unload passengers.
 4.  Each elevator should be able to respond to floor requests from
     passengers inside the elevator.
     NOTE: This is called by the elevator since these buttons exist inside 
     the elevator car.
 5.  Each elevator should be able to deal with both a service request and a
     floor request at the same time and decide what floor to go to next.
     NOTE: Because destination is set programatically at the end of a 
     service request or floor request, whichever function finishes first 
     will inevitably update the destination first.
     Both of these functions will update destination accordingly based on 
     direction - that is to say that if we are going up, and a floor 
     or service request is placed above our current destination, then the 
     destination will be updated to the higher floor.
 6.  Each elevator should keep track of how many floors it has travelled
     over time.
     Again accessible via properties:
       elevator.totalFloorsTravelled;
 7.  The Elevator System should keep track of how many service requests it
     has processed from people wanting an elevator.
     Same:
       elevatorSystem.totalServiceRequests;
     NOTE: This is the count of the number of service requests from people 
     not in the elevator car when a floor request is made. If we want to 
     update this count to reflect floor requests, we should implement a 
     count on elevators that gets incremented when a floor request is made 
     from inside the elevator, and return the sum of these values as well 
     as the totalServiceRequests value.
 8.  An elevator should be able to be put into 'Maintenance Mode' where it
     no longer responds to service requests and waits at floor 1. The
     Elevator System should handle this gracefully and send all requests to
     the functioning elevator, or do nothing in both elevators are in
     Maintenance Mode.
     NOTE: For the sake of time, my implementation drops all floor requests 
     and current destinations from an elevator upon toggling Maintenance 
     Mode. This can be remedied, but would take extra time to implement.
 9.  The Elevator System should function for 3 elevators and have all of
     the above functionality.
10.  The Elevator System should function for any number of elevators and
     have all of the above functionality.
     Added function - (void)addElevator;
