//
//  DetailViewController.m
//  Restaurants
//
//

#import "DetailViewController.h"

@implementation DetailViewController
@synthesize addressLabel;
@synthesize navigationHeader;
@synthesize cuisineLabel;
@synthesize ageLabel;
@synthesize helpfulReviewPercentageLabel;
@synthesize helpfulReviewLabel;
@synthesize star1;
@synthesize star2;
@synthesize star3;
@synthesize star4;
@synthesize star5;
@synthesize reviewLabel;
@synthesize restaurant;

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    reviewLabel.text = [review text];
    addressLabel.text = [restaurant address];
    navigationHeader.title = [restaurant name];
    cuisineLabel.text = [restaurant cuisineType];
    ageLabel.text = [NSString stringWithFormat:@"Est. %i (%i years ago)", restaurant.yearOpened, [restaurant age]];
    
    
    if ([restaurant averageCustomerReview]<1.7) {
        star1.image = [UIImage imageNamed:@"Star_ON.png"];
    }
    if (1.7<[restaurant averageCustomerReview]<2.7) {
        star1.image = [UIImage imageNamed:@"Star_ON.png"];
        star2.image = [UIImage imageNamed:@"Star_ON.png"];
    }
    if (2.7<[restaurant averageCustomerReview]<3.7) {
        star1.image = [UIImage imageNamed:@"Star_ON.png"];
        star2.image = [UIImage imageNamed:@"Star_ON.png"];
        star3.image = [UIImage imageNamed:@"Star_ON.png"];
    }
    if (3.7<[restaurant averageCustomerReview]<4.7) {
        star1.image = [UIImage imageNamed:@"Star_ON.png"];
        star2.image = [UIImage imageNamed:@"Star_ON.png"];
        star3.image = [UIImage imageNamed:@"Star_ON.png"];
        star4.image = [UIImage imageNamed:@"Star_ON.png"];
    }
    if ([restaurant averageCustomerReview] > 4.7) {
        star1.image = [UIImage imageNamed:@"Star_ON.png"];
        star2.image = [UIImage imageNamed:@"Star_ON.png"];
        star3.image = [UIImage imageNamed:@"Star_ON.png"];
        star4.image = [UIImage imageNamed:@"Star_ON.png"];
        star5.image = [UIImage imageNamed:@"Star_ON.png"];
    }
    
    //creating a best review to hold the return of the method in restaurant 
    Review* bestReview = [restaurant mostHelpfulReview];

    if (bestReview.numberOfHelpfulRatings<5) {
        helpfulReviewLabel.text = [NSString stringWithFormat:@"There are not enough ratings yet"];
    }
    if (bestReview.numberOfHelpfulRatings>=5) {
        helpfulReviewLabel.text = [NSString stringWithFormat:@" %@ --%@", bestReview.text, bestReview.reviewer];
    }
    
    helpfulReviewPercentageLabel.text = [NSString stringWithFormat:@"**Most helpful review -- %i of %i found this review helpful", review.numberOfHelpfulRatings, [review totalReview]];
}



- (void)viewDidUnload
{
    [self setAddressLabel:nil];
    [self setNavigationHeader:nil];
    [self setCuisineLabel:nil];
    [self setAgeLabel:nil];
    [self setHelpfulReviewPercentageLabel:nil];
    [self setHelpfulReviewLabel:nil];
    [self setStar1:nil];
    [self setStar2:nil];
    [self setStar3:nil];
    [self setStar4:nil];
    [self setStar5:nil];
    [self setReviewLabel:nil];
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


@end
