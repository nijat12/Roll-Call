//
//  ProfileViewController.h
//  rollcall
//
//  Created by nijat zeynalov on 12/11/13.
//  Copyright (c) 2013 eric william gonzalez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BNRImageStore.h"
#import <FacebookSDK/FacebookSDK.h>


@interface ProfileViewController : UIViewController
    <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    IBOutlet UIImageView *nonFBimageView;
}

@property (weak, nonatomic) IBOutlet FBProfilePictureView *userImage;
@property (strong, nonatomic) IBOutlet UILabel *loginName;

- (IBAction)takePicture:(id)sender;
@end
