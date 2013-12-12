//
//  AddViewController.m
//  rollcall
//
//  Created by sriyah bissoon on 12/7/13.
//  Copyright (c) 2013 eric william gonzalez. All rights reserved.
//

#import "AddViewController.h"
#import "MasterViewController.h"
#import "People.h"
#import "Event.h"
#import "SearchCreateViewController.h"
#import "SearchViewController.h"
#import "AppDelegate.h"



@implementation AddViewController
@synthesize managedObjectContext;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    AppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
    
    self.managedObjectContext = appDelegate.managedObjectContext;


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)btnAdd:(id)sender
{
    Event * newEvent = [NSEntityDescription insertNewObjectForEntityForName:@"Event" inManagedObjectContext:self.managedObjectContext];
    
    newEvent.event_name = self.txtChapterName.text;
    
    NSError *error;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
    
    self.txtChapterName.text = @"";
    NSLog(@"Chapter saved");
    [self.view endEditing:YES];
}

- (IBAction)btnCancel:(id)sender {
}

- (IBAction)txtFieldEndEditing:(id)sender
{
    [txtAdd resignFirstResponder];
}
@end
