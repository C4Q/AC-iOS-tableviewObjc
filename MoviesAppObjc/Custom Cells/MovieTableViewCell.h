//
//  MovieTableViewCell.h
//  MoviesAppObjc
//
//  Created by C4Q  on 5/16/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"

@interface MovieTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UILabel *genreLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *movieImageView;

-(void)configureCellWith:(Movie*) movie;

@end
