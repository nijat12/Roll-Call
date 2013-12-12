//
//  RosterViewController.h
//  rollcall
//
//  Created by Eric on 12/11/13.
//  Copyright (c) 2013 eric william gonzalez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MasterViewController.h"
#import "People.h"
#import "Event.h"
#import "SearchCreateViewController.h"
#import "SearchViewController.h"
#import "AddViewController.h"
#import "AppDelegate.h"

@interface RosterViewController : UITableViewController
@property (nonatomic,strong) NSManagedObjectContext* managedObjectContext;
@property (nonatomic, strong) NSArray *userInfo;
@property (nonatomic, strong) NSString *displayName;
@property (nonatomic, strong) NSArray *rosterArray;
@property (nonatomic, strong) NSString *rosterString;
@end
