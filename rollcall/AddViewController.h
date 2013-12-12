//
//  AddViewController.h
//  rollcall
//
//  Created by sriyah bissoon on 12/7/13.
//  Copyright (c) 2013 eric william gonzalez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddViewController : UIViewController
{
    IBOutlet UITextField * txtAdd;
}
@property (strong, nonatomic) IBOutlet UITextField *txtChapterName;
- (IBAction)btnAdd:(id)sender;
- (IBAction)btnCancel:(id)sender;

- (IBAction)txtFieldEndEditing:(id)sender;

@property (nonatomic,strong) NSManagedObjectContext* managedObjectContext;
@end
