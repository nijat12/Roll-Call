//
//  Event.h
//  rollcall
//
//  Created by Eric on 12/11/13.
//  Copyright (c) 2013 eric william gonzalez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class People;

@interface Event : NSManagedObject

@property (nonatomic, retain) NSDate * event_date;
@property (nonatomic, retain) NSString * event_description;
@property (nonatomic, retain) NSString * event_name;
@property (nonatomic, retain) NSSet *roster;
@end

@interface Event (CoreDataGeneratedAccessors)

- (void)addRosterObject:(People *)value;
- (void)removeRosterObject:(People *)value;
- (void)addRoster:(NSSet *)values;
- (void)removeRoster:(NSSet *)values;

@end
