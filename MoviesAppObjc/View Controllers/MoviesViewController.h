//
//  MoviesViewController.h
//  MoviesAppObjc
//
//  Created by C4Q  on 5/16/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoviesViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>

@property (strong, nonatomic) UITableView *moviesTableView;
@property (strong, nonatomic) UISearchBar *searchBar;
@property (copy, nonatomic) NSString *searchTerm;
@property (strong, nonatomic) NSArray* movies;

@end
