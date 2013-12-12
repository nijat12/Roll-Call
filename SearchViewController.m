//
//  SearchViewController.m
//  rollcall
//
//  Created by sriyah bissoon on 12/5/13.
//  Copyright (c) 2013 eric william gonzalez. All rights reserved.
//

#import "SearchViewController.h"
#import "Event.h"
#import "AppDelegate.h"
#import "MasterViewController.h"
#import "SearchCreateViewController.h"
#import "People.h"


@implementation SearchViewController
@synthesize searchTableView;
@synthesize searchBar;


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.searchBar.delegate = self;
    
    self.searchTableView.delegate = self;
    self.searchTableView.dataSource = self;
    
    totalList = [[NSMutableArray alloc] initWithObjects:@"Sigma Chi", @"Phi Delta Epsilon", @"Alpha Kappa Phi", @"College Democrats", @"College Republicans", nil];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)filterListForSearchText:(NSString *)searchText
{
    //Clears array from previous searches
    [filteredList removeAllObjects];
    
    for (NSString *search in filteredList) {
        NSRange nameRange = [search rangeOfString:searchText options:NSCaseInsensitiveSearch];
        if (nameRange.location != NSNotFound) {
            [filteredList addObject:search];
        }
    }
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if(isSearching)
    {
        return [filteredList count];
    }
    return [totalList count];
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    //    // Configure table cell
    
    if (!isSearching)
        cell.textLabel.text = [totalList objectAtIndex:indexPath.row];
    else
        
        cell.textLabel.text = [filteredList objectAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark -
#pragma mark Table view delegate

- (void) searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    
    [self.searchTableView resignFirstResponder];
}

//search bar delegate methods
-(void) searchBar:(UISearchBar *) searchBar textDidChange:(NSString *) searchText
{
    if( searchText.length ==0)
        isSearching = NO;
    else
    {
        isSearching = YES;
        filteredList = [[NSMutableArray alloc] init];
        for (NSString *str in totalList)
        {
            NSRange stringRange = [str rangeOfString:searchText options:NSCaseInsensitiveSearch];
        
        if(stringRange.location != NSNotFound)
        {
            [filteredList addObject:str];
            
        }
        }
    }
    [self.searchTableView reloadData];
}

@end
