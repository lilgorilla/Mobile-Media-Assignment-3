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
//--------------------------------------------------------------
-(int) totalReview    
{
    int totalReviewCount;
    totalReviewCount = numberOfHelpfulRatings + numberOfUnhelpfulRatings;
    return totalReviewCount;
}
//--------------------------------------------------------------
-(float) helpfulPercentage
{
    int percentage;
    percentage = numberOfHelpfulRatings/numberOfUnhelpfulRatings;
    return percentage;
}

@end
