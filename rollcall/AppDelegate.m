//
//  AppDelegate.m
//  rollcall
//
//  Created by eric william gonzalez on 12/3/13.
//  Copyright (c) 2013 eric william gonzalez. All rights reserved.
//

#import "AppDelegate.h"

#import "People.h"
#import "Event.h"
#import "SearchCreateViewController.h"
#import "SearchViewController.h"
#import "AddViewController.h"

@implementation AppDelegate

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;
@synthesize navController = _navController;
@synthesize viewController = _viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [FBProfilePictureView class];
//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    
    self.viewController = (MasterViewController *)self.navController.topViewController;
    
    self.navController = (UINavigationController *)self.window.rootViewController;

    
    self.window.rootViewController = self.navController;
    
    [self.window makeKeyAndVisible];
    
    
    // See if the app has a valid token for the current state.
    if (FBSession.activeSession.state == FBSessionStateCreatedTokenLoaded) {
        // To-do, show logged in view
    } else {
        // No, display the login page.
        [self showLoginView];
    }
    
    if (FBSession.activeSession.state == FBSessionStateCreatedTokenLoaded) {
        // Yes, so just open the session (this won't display any UX).
        [self openSession];
    } else {
        // No, display the login page.
        [self showLoginView];
    }
    
//
//    NSDateFormatter *dateformatter = [[NSDateFormatter alloc]init];
//    [dateformatter setDateStyle:NSDateFormatterShortStyle];
//    [dateformatter setTimeStyle:NSDateFormatterNoStyle];
//    [dateformatter setDateFormat:@"dd/MM/yyyy"];
//    NSDate *date = [[NSDate alloc] init];
//    date = [dateformatter dateFromString:@"12/12/2013"];
//    //code for filling core data store
      NSManagedObjectContext *context = [self managedObjectContext];
//    People *userInfo1 = [NSEntityDescription
//                       insertNewObjectForEntityForName:@"People"
//                       inManagedObjectContext:context];
//    
//    userInfo1.first_name = @"John";
//    userInfo1.last_name = @"Johnson";
//    userInfo1.status = @"active";
//    userInfo1.attendance = @"1,1,1,1,1,1";
//    
//
//    People *userInfo2 = [NSEntityDescription
//                        insertNewObjectForEntityForName:@"People"
//                        inManagedObjectContext:context];
//    
//    userInfo2.first_name = @"Ace";
//    userInfo2.last_name = @"Ash";
//    userInfo2.status = @"active";
//    userInfo2.attendance = @"1,1,1,1,1,0";
//
//    People *userInfo3 = [NSEntityDescription
//                        insertNewObjectForEntityForName:@"People"
//                        inManagedObjectContext:context];
//    
//    userInfo3.first_name = @"Adam";
//    userInfo3.last_name = @"West";
//    userInfo3.status = @"active";
//    userInfo3.attendance = @"1,0,0,1,1,1";
//    
//    People *userInfo4 = [NSEntityDescription
//                        insertNewObjectForEntityForName:@"People"
//                        inManagedObjectContext:context];
//    
//    userInfo4.first_name = @"Peter";
//    userInfo4.last_name = @"Parker";
//    userInfo4.status = @"active";
//    userInfo4.attendance = @"1,1,1,1,0,1";
//    NSSet *roster = [NSSet setWithObjects:userInfo1, userInfo2, userInfo3, userInfo4, nil];
//    
//    Event *eventInfo1 = [NSEntityDescription
//                            insertNewObjectForEntityForName:@"Event"
//                            inManagedObjectContext:context];
//    
//    eventInfo1.event_name = @"Mixer";
//    eventInfo1.event_date = date;
//    eventInfo1.event_description = @"Mix it up!";    
//    eventInfo1.roster = roster;
//    
//    
//    Event *eventInfo2 = [NSEntityDescription
//                         insertNewObjectForEntityForName:@"Event"
//                         inManagedObjectContext:context];
//    
//    eventInfo2.event_name = @"Meeting";
//    eventInfo2.event_date = date;
//    eventInfo2.event_description = @"Mix it up!";
//    eventInfo2.roster = roster;
//    
//    Event *eventInfo3 = [NSEntityDescription
//                         insertNewObjectForEntityForName:@"Event"
//                         inManagedObjectContext:context];
//    
//    eventInfo3.event_name = @"Fund Raiser";
//    eventInfo3.event_date = date;
//    eventInfo3.event_description = @"Mix it up!";
//    eventInfo3.roster = roster;
//    
//    Event *eventInfo4 = [NSEntityDescription
//                         insertNewObjectForEntityForName:@"Event"
//                         inManagedObjectContext:context];
//    
//    eventInfo4.event_name = @"Meeting";
//    eventInfo4.event_date = date;
//    eventInfo4.event_description = @"Mix it up!";
//    eventInfo4.roster = roster;
//    
//    NSSet *agenda = [NSSet setWithObjects:eventInfo1, eventInfo2, eventInfo3, eventInfo4, nil];
//    
//    userInfo1.events = agenda;
//    userInfo2.events = agenda;
//    userInfo3.events = agenda;
//    userInfo4.events = agenda;
//   
    NSError *error;
//    if (![context save:&error]) {
//        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
//    }
   
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"People" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    for (NSManagedObject *info in fetchedObjects) {
        NSLog(@"First: %@", [info valueForKey:@"first_name"]);
        NSManagedObject *details = [info valueForKey:@"events"];
        NSLog(@"Event: %@", [details valueForKey:@"event_name"]);
    }
    
    
    //****
    
    //Change view flow/properties here
//    UINavigationController *navigationController = (UINavigationController *)self.window.rootViewController;
//    MasterViewController *controller = (MasterViewController *)navigationController.topViewController;
    
    self.viewController.managedObjectContext = self.managedObjectContext;
    
    return YES;
    
    
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


#pragma mark - Facebook Login

- (void)showLoginView
{
//    UIViewController *topViewController = [self.navController topViewController];
//    UIViewController *modalViewController = [topViewController modalViewController];

    UIViewController *topViewController = [self.navController topViewController];
    
    LoginViewController* loginViewController =
    [[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
    [topViewController presentViewController:loginViewController animated:NO completion:nil];
    
    // If the login screen is not already displayed, display it. If the login screen is
    // displayed, then getting back here means the login in progress did not successfully
    // complete. In that case, notify the login view so it can update its UI appropriately.
//    if (![modalViewController isKindOfClass:[LoginViewController class]]) {
//        LoginViewController* loginViewController = [[LoginViewController alloc]
//                                                    initWithNibName:@"LoginViewController"
//                                                    bundle:nil];
//        [topViewController presentViewController:loginViewController animated:NO completion:nil];
//    } else {
//        LoginViewController* loginViewController =
//        (LoginViewController*)modalViewController;
//        [loginViewController loginFailed];
//    }
}

- (void)sessionStateChanged:(FBSession *)session
                      state:(FBSessionState) state
                      error:(NSError *)error
{
    switch (state) {
        case FBSessionStateOpen: {
            UIViewController *topViewController =
            [self.navController topViewController];
            if ([[topViewController modalViewController]
                 isKindOfClass:[LoginViewController class]]) {
                [topViewController dismissModalViewControllerAnimated:YES];
            }
        }
            break;
        case FBSessionStateClosed:
        case FBSessionStateClosedLoginFailed:
            // Once the user has logged in, we want them to
            // be looking at the root view.
            [self.navController popToRootViewControllerAnimated:NO];
            
            [FBSession.activeSession closeAndClearTokenInformation];
            
            [self showLoginView];
            break;
        default:
            break;
    }
    
    
    if (error) {
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"Error"
                                  message:error.localizedDescription
                                  delegate:nil
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil];
        [alertView show];
    }
}

- (void)openSession
{
    [FBSession openActiveSessionWithReadPermissions:nil
                                       allowLoginUI:YES
                                  completionHandler:
     ^(FBSession *session,
       FBSessionState state, NSError *error) {
         [self sessionStateChanged:session state:state error:error];
     }];
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation
{
    return [FBSession.activeSession handleOpenURL:url];
}

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
             // Replace this implementation with code to handle the error appropriately.
             // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        } 
    }
}

#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"rollcall" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"rollcall.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
         @{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES}
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }    
    
    return _persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}


//get chapter records from core data
-(NSArray *) getAllChapterRecords
{
 
            // initializing NSFetchRequest
            NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
            
            //Setting Entity to be Queried
            NSEntityDescription *entity = [NSEntityDescription entityForName:@"Chapter"
                                                      inManagedObjectContext:self.managedObjectContext];
            [fetchRequest setEntity:entity];
            NSError* error;
            
            // Query on managedObjectContext With Generated fetchRequest
            NSArray *fetchedRecords = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
            
            // Returning Fetched Records
            return fetchedRecords;

}

@end
