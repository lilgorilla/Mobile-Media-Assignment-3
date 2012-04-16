//
//  Restaurant.m
//  Restaurants
//

#import "Restaurant.h"
#import "Review.h"

@implementation Restaurant
@synthesize address, name, cuisineType, yearOpened, reviews, bestReview, isFavorite;

-(id)init{
    self = [super init];
    if(self){
    }
    return self;
}
//--------------------------------------------------------------

-(int)age
{
    return 2012 - yearOpened;
}
//--------------------------------------------------------------

-(Review*) mostHelpfulReview
{
    int ratingCount;    
    for (int i=0; i< reviews.count; i++) 
    {
        Review* review = [reviews objectAtIndex: i ];
        if (review.numberOfHelpfulRatings > 5) {
            if (review.numberOfHelpfulRatings > ratingCount) 
            {
                ratingCount = review.numberOfHelpfulRatings;
                bestReview = review;
            }
        }
    
    }
    return bestReview;
}
//--------------------------------------------------------------

-(float)averageCustomerReview
{
    float reviewAvgTotal;
    float reviewAvg;
    for (int i=0; i < reviews.count; i++) 
    {
        Review* review = [reviews objectAtIndex: i ];

        reviewAvgTotal += review.score;
    }
    reviewAvg = reviewAvgTotal/reviews.count;
    return reviewAvg;
    
}
//--------------------------------------------------------------

-(int) totalReview    
{
    int totalReviewCount;

    totalReviewCount = bestReview.numberOfHelpfulRatings + bestReview.numberOfunhelpfulRatings;

    return totalReviewCount;
}

//--------------------------------------------------------------



@end
