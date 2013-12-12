//
//  ChapterViewController.m
//  rollcall
//
//  Created by sriyah bissoon on 12/7/13.
//  Copyright (c) 2013 eric william gonzalez. All rights reserved.
//

#import "ChapterViewController.h"
#import "AppDelegate.h"
#import "Event.h"


@implementation ChapterViewController
@synthesize chapterTableView;
@synthesize fetchedRecordArray;

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
   // self.managedObjectContext = appDelegate.managedObjectContext;
    
    // Fetching Records and saving it in "fetchedRecordsArray" object
    self.fetchedRecordArray = [appDelegate getAllChapterRecords];
    [self.chapterTableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.fetchedRecordArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Chapter" forIndexPath:indexPath];
    Event * getEvent = [self.fetchedRecordArray objectAtIndex:indexPath.row];
    cell.textLabel.text = getEvent.event_name;
    return cell;
}

@end
