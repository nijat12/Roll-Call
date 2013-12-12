//
//  chapterViewController.h
//  rollcall
//
//  Created by eric william gonzalez on 12/3/13.
//  Copyright (c) 2013 eric william gonzalez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProfileViewController.h"
#import "AppDelegate.h"

#import <FacebookSDK/FacebookSDK.h>

@interface MasterViewController : UITableViewController

@property (nonatomic,strong) NSManagedObjectContext* managedObjectContext;
@property (nonatomic, strong) NSArray *userInfo;
@property (nonatomic, strong) NSString *displayName;
@property (nonatomic, strong) NSArray *rosterArray;
@property (nonatomic, strong) NSString *rosterString;
@property (nonatomic, strong) UIBarButtonItem *addButton;
@property (nonatomic, strong) UIBarButtonItem *profileButton;
//@property (nonatomic, strong) ProfileViewController* profile;
@end
