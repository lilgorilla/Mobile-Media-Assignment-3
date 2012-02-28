//
//  Restaurant.m
//  Restaurants
//

#import "Restaurant.h"


@implementation Restaurant
@synthesize address, name, cuisineType, yearOpened;

-(id)init{
    self = [super init];
    if(self){
        
    }
    return self;
}

-(int)age
{
    return 2012 - yearOpened;
}

@end
