//
//  MovieTableViewCell.m
//  MoviesAppObjc
//
//  Created by C4Q  on 5/16/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

#import "MovieTableViewCell.h"

@implementation MovieTableViewCell

-(void)configureCellWith:(Movie *)movie {
    self.nameLabel.text = movie.name;
    NSString *genreText;
    switch (movie.genre) {
        case Genre_Action:
            genreText = @"Action";
            break;
        case Genre_Drama:
            genreText = @"Drama";
            break;
        case Genre_Animation:
            genreText = @"Animation";
            break;
    }
    self.genreLabel.text = genreText;
    self.descriptionLabel.text = movie.longDescription;
    self.yearLabel.text = [NSString stringWithFormat:@"%d", movie.year];
    self.movieImageView.image = [UIImage imageNamed:[movie imageName]];
}

@end
