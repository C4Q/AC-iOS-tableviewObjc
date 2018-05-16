//
//  MovieDetailViewController.h
//  MoviesAppObjc
//
//  Created by C4Q  on 5/16/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"

@interface MovieDetailViewController : UIViewController

@property (strong, nonatomic) UIImageView* movieImageView;
@property (strong, nonatomic) Movie* movie;

-(instancetype)initWithMovie:(Movie*) movie;

@end
