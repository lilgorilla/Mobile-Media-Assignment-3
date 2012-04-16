//
//  ReviewViewControllerViewController.h
//  Restaurants
//
//  Created by Michelle Kirby on 4/16/12.
//  Copyright (c) 2012 Parsons The New School. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Restaurant.h"
#import "REVIEW.H"


@interface ReviewViewController : UITableViewController
{
    Restaurant* restaurant;
    Review* bestReview;
}

@property(readwrite, strong) Restaurant* restaurant;
@property(readwrite, strong) Review* bestReview;


@end

