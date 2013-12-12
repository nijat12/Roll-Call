//
//  People.h
//  rollcall
//
//  Created by Eric on 12/11/13.
//  Copyright (c) 2013 eric william gonzalez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Event;

@interface People : NSManagedObject

@property (nonatomic, retain) NSString * attendance;
@property (nonatomic, retain) NSString * first_name;
@property (nonatomic, retain) NSString * last_name;
@property (nonatomic, retain) NSString * status;
@property (nonatomic, retain) NSSet *events;
@end

@interface People (CoreDataGeneratedAccessors)

- (void)addEventsObject:(Event *)value;
- (void)removeEventsObject:(Event *)value;
- (void)addEvents:(NSSet *)values;
- (void)removeEvents:(NSSet *)values;

@end
