//
//  Movie.h
//  MoviesAppObjc
//
//  Created by C4Q  on 5/16/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, Genre) {
    Genre_Action,
    Genre_Animation,
    Genre_Drama
};

@interface Movie : NSObject

@property (copy, nonatomic) NSString* name;
@property (copy, nonatomic) NSString* longDescription;
@property (assign) int year;
@property (assign) Genre genre;

-(instancetype)initWithName:(NSString*) name andDescription:(NSString*) description andYear:(int) year andGenre:(Genre) genre;
-(NSString*)imageName;
+(NSArray*)testMovies;

@end
