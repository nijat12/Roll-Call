//
//  SearchViewController.h
//  rollcall
//
//  Created by sriyah bissoon on 12/7/13.
//  Copyright (c) 2013 eric william gonzalez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>
{
    NSMutableArray *totalList;
    NSMutableArray *filteredList;
    BOOL isSearching;
}


@property (nonatomic, weak) IBOutlet UISearchBar  *searchBar;
@property (nonatomic, weak) IBOutlet UITableView  *searchTableView;


@end




