//
//  chapterViewController.m
//  rollcall
//
//  Created by eric william gonzalez on 12/3/13.
//  Copyright (c) 2013 eric william gonzalez. All rights reserved.
//

//TO DO
//Implement Details View
//Create action/view for profile button
//find a way to get the number of chapters earlier
//Get add/search working
//get dummy data for database

#import "MasterViewController.h"
#import "People.h"
#import "Event.h"
#import "SearchCreateViewController.h"
#import "SearchViewController.h"
#import "AddViewController.h"

@implementation MasterViewController
@synthesize managedObjectContext;
@synthesize userInfo;
@synthesize displayName, rosterArray, rosterString;
@synthesize addButton, profileButton;// profile;


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
    addButton = [[UIBarButtonItem alloc] initWithTitle:@"+" style:UIBarButtonItemStyleBordered target:self action:@selector(goToSearchCreateScreen:)];
    profileButton = [[UIBarButtonItem alloc] initWithTitle:@"Profile" style:UIBarButtonItemStyleBordered target:self action:@selector(goToProfileScreen:)];
    ;
    self.navigationItem.rightBarButtonItem = addButton;
    self.navigationItem.leftBarButtonItem = [self editButtonItem];
    
}

-(IBAction) goToSearchCreateScreen:(id)sender
{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    SearchCreateViewController *sCViewController = (SearchCreateViewController *)[storyboard instantiateViewControllerWithIdentifier:@"SearchCreateViewController"];
    [[self navigationController] pushViewController:sCViewController
                                           animated:YES];
}

-(IBAction) goToProfileScreen:(id)sender
{
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
//    ProfileViewController *profile = (ProfileViewController *)[storyboard instantiateInitialViewController];
    ProfileViewController *profile = [[ProfileViewController alloc]init];
    [[self navigationController] pushViewController:profile animated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    
    cell.textLabel.text =@"Sigma Chi";
    //cell.detailTextLabel.text = [NSString stringWithFormat:@"%@, %@",
   //                              info.last_name, info.email];
    
    return cell;
}


- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
     return 1;
}
//-(void)tableView:(UITableView *) tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
//    //delete items when button is hit
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        //[rosterArray removeObjectAtIndex:indexPath.row];
//        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
//    }
//}

- (void) setEditing:(BOOL)editing animated:(BOOL)animated{
    [super setEditing:editing animated:animated];
    [self.tableView setEditing:editing animated:animated];
    
    if (editing){
        self.navigationItem.rightBarButtonItem = profileButton;
        addButton.enabled = true;
//        [[self navigationController] pushViewController:profile animated:YES];
    } else {
        self.navigationItem.rightBarButtonItem = addButton;
        addButton.enabled = true;
        //profileButton.enabled = true;
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
