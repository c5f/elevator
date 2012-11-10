/**
 * Implementation
 *
 * Elevator.m
 *
 * Created by Colin Scott-Fleming on 2012-11-09
 */

#import "Elevator.h"

const int MAX_FLOORS = 10;

@interface Elevator ()



@end

@implementation Elevator

@synthesize currentFloor;
@synthesize destinationFloor;
@synthesize isMoving;
@synthesize currentDirection;
@synthesize floorRequests;
@synthesize totalFloorsTravelled;

/**
 * Initialize on floor 1 not moving.
 */
- (id) init {
  self = [super init];
  self.currentFloor = 1;
  self.destinationFloor = 0;
  self.isMoving = NO;
  self.currentDirection = none;
  self.floorRequests = [[NSMutableArray alloc] initWithCapacity:MAX_FLOORS];
  self.totalFloorsTravelled = 0;
  
  return self;
}

/**
 * Add a floor request to an elevator.
 */
- (void) addServiceRequestForFloor:(int)floor {
  
  // Check for duplicates.
  if (![self.floorRequests containsObject:[NSNumber numberWithInt:floor]]) {
    [self.floorRequests addObject:[NSNumber numberWithInt:floor]];
  }
  
  // If we don't have a destination, set the destination and direction now.
  if (!self.destinationFloor) {
    self.destinationFloor = floor;
    self.currentDirection = (destinationFloor > currentFloor) ? up : down;
  }
  
  // If we are already moving, check if we can update the destination floor.
  if (self.isMoving) {
    self.destinationFloor = (self.currentDirection == up) ?
      MAX(self.destinationFloor, floor) : MIN(self.destinationFloor, floor);
  }
}

/**
 * Very simple implementation of moving.
 *
 * There is no "stop" action implemented seeing that to the ElevatorSystem, 
 * this is transparent. That is to say that an elevator that is stopping while 
 * en route to another floor or service request
 */
- (void) moveToDestination {
  self.isMoving = YES;
  
  while (self.currentFloor != self.destinationFloor) {
    // This step should be run stepwise by the program to emulate true
    // elevator behavior, but this is a lazy implementation.
    self.currentFloor = (self.currentFloor < self.destinationFloor) ?
      self.currentFloor + 1 : self.currentFloor - 1;
    
    totalFloorsTravelled++;
    
    NSNumber *floor = [NSNumber numberWithInt:self.currentFloor];
    
    /* If we can drop off passengers on the way to the current destination,
     * drop them off and remove the floor request from the list
     */
    if ([self.floorRequests containsObject:floor]) {
      [floorRequests removeObjectIdenticalTo:floor];
    }
  }
  
  self.isMoving = NO;
  self.currentDirection = none;
}

/**
 * Add a floor request.
 */
- (void) addFloorRequestForFloor:(int)floor {
  [self addServiceRequestForFloor:floor];
}

/**
 * Maintenance Mode toggle function.
 */
- (void) toggleMaintenanceMode {
  if (self.isInMaintenanceMode) {
    self.isInMaintenanceMode = NO;
  }
  
  else {
    self.isInMaintenanceMode = YES;
    self.destinationFloor = 1;
    [self.floorRequests removeAllObjects];
    
    [self moveToDestination];
  }
}

- (void) dealloc {
  floorRequests = nil;
  
}

@end
