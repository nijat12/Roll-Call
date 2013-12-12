//
//  AppDelegate.h
//  rollcall
//
//  Created by eric william gonzalez on 12/3/13.
//  Copyright (c) 2013 eric william gonzalez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MasterViewController.h"
#import "LoginViewController.h"
#import <FacebookSDK/FacebookSDK.h>


@class MasterViewController;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

-(NSArray *) getAllChapterRecords;


@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) MasterViewController *viewController;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (strong, nonatomic) UINavigationController* navController;

//@property (strong, nonatomic) MasterViewController *mainViewController;

- (void)openSession;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
