//
//  MoviesViewController.m
//  MoviesAppObjc
//
//  Created by C4Q  on 5/16/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

#import "MoviesViewController.h"
#import "MovieTableViewCell.h"
#import "MovieDetailViewController.h"

#define CELLID "Movie Cell"

@interface MoviesViewController ()

@end

@implementation MoviesViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBackground];
    [self allocInitSubviews];
    [self configureSubviews];
    [self addSubviews];
    [self configureConstraints];
    [self loadData];
}

#pragma mark - Setup UI

-(void)setBackground {
    self.view.backgroundColor = UIColor.cyanColor;
}

-(void)allocInitSubviews {
    _moviesTableView = [[UITableView alloc] initWithFrame:CGRectZero];
    _searchBar = [[UISearchBar alloc] initWithFrame:CGRectZero];
    _movies = [[NSArray alloc] init];
    _searchTerm = @"";
}

-(void)configureSubviews {
    [self configureTableView];
    [self configureSearchBar];
}

-(void)configureTableView {
    self.moviesTableView.dataSource = self;
    self.moviesTableView.delegate = self;
    UINib* nib = [UINib nibWithNibName:@"MovieTableViewCell" bundle:nil];
    [self.moviesTableView registerNib:nib forCellReuseIdentifier:@CELLID];
}

-(void)configureSearchBar {
    self.searchBar.delegate = self;
    self.searchBar.placeholder = @"Search for a movie!";
}

-(void)addSubviews {
    [self.view addSubview:self.moviesTableView];
    [self.view addSubview:self.searchBar];
}

-(void)configureConstraints {
    self.searchBar.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
                                              [self.searchBar.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor],
                                              [self.searchBar.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
                                              [self.searchBar.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
                                              ]
     ];
    
    self.moviesTableView.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
      [self.moviesTableView.topAnchor constraintEqualToAnchor:self.searchBar.bottomAnchor],
      [self.moviesTableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor],
      [self.moviesTableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
      [self.moviesTableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor]                                            ]
     ];
}

#pragma mark - Load/Filter Data

-(void)loadData {
    self.movies = [Movie testMovies];
}

-(NSArray*)filteredMovies {
    if ([self.searchTerm isEqualToString:@""])
        return self.movies;
    NSPredicate *searchPredicate = [NSPredicate predicateWithFormat:@"name CONTAINS %@", self.searchTerm];
    NSArray *filteredArr = [self.movies filteredArrayUsingPredicate:searchPredicate];
    return filteredArr;
}

#pragma mark - UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Movie *selectedMovie = [self filteredMovies][indexPath.row];
    MovieDetailViewController *movieDetailVC = [[MovieDetailViewController alloc] initWithMovie:selectedMovie];
    [self.navigationController pushViewController:movieDetailVC animated:YES];
}

#pragma mark - UITableView DataSource

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    MovieTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@CELLID forIndexPath:indexPath];
    if (cell) {
        Movie *movie = [self filteredMovies][indexPath.row];
        [cell configureCellWith:movie];
    }
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self filteredMovies].count;
}

#pragma mark - UISearchBar Delegate

- (BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    NSString *newSearchTerm = [searchBar.text stringByReplacingCharactersInRange:range withString:text];
    self.searchTerm = newSearchTerm;
    [self.moviesTableView reloadData];
    return YES;
}

@end
