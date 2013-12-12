//
//  ProfileViewController.m
//  rollcall
//
//  Created by nijat zeynalov on 12/11/13.
//  Copyright (c) 2013 eric william gonzalez. All rights reserved.
//

#import "ProfileViewController.h"


@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//What to display
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (BNRImageStore.sharedStore.dictionary.count > 0)
    {
        self.userImage.hidden = YES;
        nonFBimageView.hidden = NO;
        [self populateUserDetails];
        
        UIImage *image = [[BNRImageStore sharedStore] getImage];
        
        [nonFBimageView setImage:image];
    }
    else
    {
    if (FBSession.activeSession.isOpen)
    {
        [self populateUserDetails];
    }
    }
    
    //Pull the image from CoreData
}

- (void)populateUserDetails
{
    if (FBSession.activeSession.isOpen) {
        [[FBRequest requestForMe] startWithCompletionHandler:
         ^(FBRequestConnection *connection,
           NSDictionary<FBGraphUser> *user,
           NSError *error) {
             if (!error) {
                 self.loginName.text = [NSString stringWithFormat:@"Hello %@" , user.name];
                 
                 self.userImage.profileID = user.id;
             }
         }];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)takePicture:(id)sender
{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        [imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
    }
    else
    {
        [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }
    [imagePicker setDelegate:self];
    
    [self presentViewController:imagePicker animated:YES completion:nil];
}


- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    [[BNRImageStore sharedStore] setImage:image];
    
    self.userImage.hidden = YES;
    
    nonFBimageView.hidden = NO;
    
    [nonFBimageView setImage:image];
    
    //Write the image to Core Data
    
    [self dismissViewControllerAnimated:YES
                             completion:nil];
}

@end
