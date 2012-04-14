//
//  Review.m
//  Restaurants
//
//  Created by Michelle Kirby on 3/5/12.
//  Copyright (c) 2012 Parsons The New School. All rights reserved.
//

#import "Review.h"

@implementation Review
@synthesize reviewer, text, score, numberOfHelpfulRatings, numberOfunhelpfulRatings;

-(id)init
{
    self = [super init];
    if(self)
    {
        
    }
    return self;
}
-(float)helpfulPercentage{

        float percentage;
        percentage = numberOfHelpfulRatings/ (numberOfHelpfulRatings + numberOfunhelpfulRatings);
        return percentage;

}

-(int)totalReviewRating{
    int totalReviewRatings = numberOfHelpfulRatings + numberOfunhelpfulRatings;
    return totalReviewRatings;
}

@end
