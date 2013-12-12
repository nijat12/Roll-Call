//
//  ChapterViewController.h
//  rollcall
//
//  Created by sriyah bissoon on 12/7/13.
//  Copyright (c) 2013 eric william gonzalez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChapterViewController : UIViewController
@property (nonatomic, strong) NSArray *fetchedRecordArray;
@property (nonatomic, weak) IBOutlet UITableView  *chapterTableView;



@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;



@end
