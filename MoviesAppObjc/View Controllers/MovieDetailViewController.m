//
//  MovieDetailViewController.m
//  MoviesAppObjc
//
//  Created by C4Q  on 5/16/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

#import "MovieDetailViewController.h"

@interface MovieDetailViewController ()

@end

@implementation MovieDetailViewController

-(instancetype)initWithMovie:(Movie *)movie {
    self = [super init];
    if (self) {
        _movie = movie;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self allocInitSubviews];
    [self configureSubviews];
    [self addSubviews];
    [self configureConstraints];
}

-(void)allocInitSubviews {
    _movieImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
}

-(void)configureSubviews {
    self.movieImageView.image = [UIImage imageNamed:[self.movie imageName]];
}

-(void)addSubviews {
    [self.view addSubview:self.movieImageView];
}

-(void)configureConstraints {
    self.movieImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
                                              [self.movieImageView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor],
                                              [self.movieImageView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor],
                                              [self.movieImageView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
                                              [self.movieImageView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor]
                                              ]
     ];
}


@end
