/**
 * Implementation
 *
 * Elevator.m
 *
 * Created by Colin Scott-Fleming on 2012-11-09
 */

#import "ElevatorSystem.h"

@interface ElevatorSystem()

-(Elevator *)selectBestElevatorForFloor:(int)floor;

@end

@implementation ElevatorSystem

@synthesize elevators;
@synthesize totalServiceRequests;

- (id) init {
  self = [super init];
  
  /* Starting with 3 elevators for initial implementation */
  self.elevators = [[NSMutableArray alloc] init];
  
  [self.elevators addObject: [[Elevator alloc] init]];
  [self.elevators addObject: [[Elevator alloc] init]];
  [self.elevators addObject: [[Elevator alloc] init]];
  
  return self;
}

/**
 * Process a service request from a floor.
 */
- (void) serviceRequestFromFloor:(int)floor {
  Elevator *selection = [self selectBestElevatorForFloor:floor];
  
  /**
   * Add the service request only if we have an elevator not in Maintenance
   * Mode.
   */
  if (selection) {
    [selection addServiceRequestForFloor:floor];
    self.totalServiceRequests++;
  }
}

/**
 * Selects the best elevator from the array of elevators.
 */
- (Elevator *)selectBestElevatorForFloor:(int)floor {
  /* Just pick the closest elevator not in Maintenance Mode for now. 
   *
   * This does not take the current elevator direction into account, but this 
   * functionality can be added later (again time constraints).
   */
  Elevator *selection = [self.elevators objectAtIndex: 0];
  
  for (Elevator *other in self.elevators)
    if (abs(other.currentFloor - floor) <
        abs(selection.currentFloor - floor) &&
        !other.isInMaintenanceMode) {
      selection = other;
    }
  
  // If all elevators are in Maintenance Mode, return nil.
  if (selection.isInMaintenanceMode) {
    return nil;
  }
  
  return selection;
}

- (void) addElevator {
  [self.elevators addObject:[[Elevator alloc] init]];
}

- (void) dealloc {
  self.elevators = nil;
  
}

@end
