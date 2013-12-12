//
//  SearchCreateViewController.m
//  rollcall
//
//  Created by sriyah bissoon on 12/7/13.
//  Copyright (c) 2013 eric william gonzalez. All rights reserved.
//

#import "SearchCreateViewController.h"
#import "SearchViewController.h"

@interface SearchCreateViewController ()

@end

@implementation SearchCreateViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnSearch
{
    //[self performSegueWithIdentifier:@"SearchViewController" sender:self];
    //    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
   // SearchViewController *sViewController = (SearchViewController *)[storyboard instantiateViewControllerWithIdentifier:@"SearchViewController"];
   // [self presentViewController:sViewController animated:YES completion:nil];
    
}

- (IBAction)btnCreate:(id)sender {
    //SearchViewController *sViewController = (SearchViewController *)[UIStoryboard instantiateViewControllerWithIdentifier:@"SearchViewController"];
    //[[self navigationController] pushViewController:sViewController animated:YES];
}

@end
