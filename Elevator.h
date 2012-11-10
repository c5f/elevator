/**
 * Implementation
 *
 * Elevator.h
 *
 * Created by Colin Scott-Fleming on 2012-11-09
 */

#import <Foundation/Foundation.h>

extern int const MAX_FLOORS;

@interface Elevator : NSObject

typedef enum { none = 0, up = 1, down = 2 } direction;

@property int currentFloor;
@property int destinationFloor;
@property BOOL isMoving;
@property direction currentDirection;
@property NSMutableArray *floorRequests;
@property int totalFloorsTravelled;
@property BOOL isInMaintenanceMode;

- (void) addServiceRequestForFloor:(int)floor;
- (void) moveToDestination;
- (void) addFloorRequestForFloor:(int)floor;
- (void) toggleMaintenanceMode;

@end
