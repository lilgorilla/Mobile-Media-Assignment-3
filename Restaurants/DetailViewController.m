//
//  DetailViewController.m
//  Restaurants
//
//

#import "DetailViewController.h"
#import "ReviewViewController.h"

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
@synthesize showAllReviews;
@synthesize favoriteButton;
@synthesize bestReview;

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
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
    bestReview = [restaurant mostHelpfulReview];

    if (bestReview.numberOfHelpfulRatings<5) {
        helpfulReviewLabel.text = [NSString stringWithFormat:@"There are not enough ratings yet"];
    }
    if (bestReview.numberOfHelpfulRatings>=5) {
        helpfulReviewLabel.text = [NSString stringWithFormat:@" %@ --%@", bestReview.text, bestReview.reviewer];
            helpfulReviewPercentageLabel.text = [NSString stringWithFormat:@"**Most helpful review -- %i of %i found this review helpful", bestReview.numberOfHelpfulRatings, bestReview.numberOfunhelpfulRatings + bestReview.numberOfHelpfulRatings];
    }
    if (restaurant.isFavorite) {
        favoriteButton.image = [UIImage imageNamed:@"heart_selected.png"];
    }
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    ReviewViewController* reviewVC = (ReviewViewController*)[segue destinationViewController];
    
    reviewVC.restaurant = restaurant;
    reviewVC.bestReview = bestReview;

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
    [self setShowAllReviews:nil];
    [self setFavoriteButton:nil];
    [self setFavoriteButton:nil];
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

- (IBAction)markAsFavorite:(id)sender {
    if (restaurant.isFavorite == false) {
        favoriteButton.image = [UIImage imageNamed:@"heart_selected.png"];
        restaurant.isFavorite = true;
    }else{
        favoriteButton.image = [UIImage imageNamed:@"heart.png"];
        restaurant.isFavorite = false;
    }

}
@end
