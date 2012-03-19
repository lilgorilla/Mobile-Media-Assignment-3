//
//  Review.h
//  Restaurants
//
//  Created by Michelle Kirby on 3/5/12.
//  Copyright (c) 2012 Parsons The New School. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Review : NSObject
{
    NSString* reviewerName;
    NSString* text;

    int score;
    int numberOfHelpfulRatings;
    int numberOfUnhelpfulRatings;
}

-(int) totalReview;
@property(readwrite, strong) NSString* text;
@property(readwrite, strong) NSString* reviewer;
@property(readwrite) int score;
@property(readwrite) int numberOfHelpfulRatings;
@property(readwrite) int numberOfunhelpfulRatings;
@property(readwrite) NSArray* reviews;




@end
