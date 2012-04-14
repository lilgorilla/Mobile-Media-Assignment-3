//
//  MasterViewController.m
//  Restaurants
//
//

#import "MasterViewController.h"
#import "Restaurant.h"

@implementation MasterViewController
@synthesize restaurants;

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    Restaurant* piopio = [[Restaurant alloc] init];
    
    piopio.name = @"Pio Pio";
    piopio.address = @"746 First Avenue\nNew York, NY 10128";
    piopio.cuisineType = @"Peruvian";
    piopio.yearOpened = 1995; 

    Review* review1 = [[Review alloc] init];
    review1.text = @"What fab-u-lass chicken! We could eat it all day if we didn't have to stop to drink sangria!";
    review1.reviewer = @"The Addams";
    review1.score = 5;
    review1.numberOfHelpfulRatings = 19;
    review1.numberOfunhelpfulRatings = 8;
    //    
    Review* review2 = [[Review alloc] init];
    review2.text = @"I DONE POSTED ON DA INTARWEBS!";
    review2.reviewer = @"Anonymous";
    review2.score = 1;
    review2.numberOfHelpfulRatings = 0;
    review2.numberOfunhelpfulRatings = 45;
    //    
    Review* review3 = [[Review alloc] init];
    review3.text = @"Some of the best chicken I've ever eaten. A helpful tip: get some green (Aji) sauce to go, they sell it by the pint!";
    review3.reviewer = @"Jim Carr";
    review3.score = 5;
    review3.numberOfHelpfulRatings = 28;
    review3.numberOfunhelpfulRatings = 2;
    //    
    Review* review4 = [[Review alloc] init];
    review4.text = @"While the food is amazing, they often simply don't pick up the phone when ordering out!";
    review4.reviewer = @"Paul";
    review4.score = 4;
    review4.numberOfHelpfulRatings = 14;
    review4.numberOfunhelpfulRatings = 5;
    
    Review* review5 = [[Review alloc] init];
    review5.text = @"Nothing beats good southern breakfast of Fried Chicken 'n Waffles";
    review5.reviewer = @"Michelle";
    review5.score = 4;
    review5.numberOfHelpfulRatings = 10;
    review5.numberOfunhelpfulRatings = 2;

    
    //adding reviews to the review array located in restaurant.
    piopio.reviews = [[NSMutableArray alloc] initWithObjects:review1, review2, review3, review4, nil];   
    //restaurant.reviews =[addObject: review5];
    
    Restaurant* no7 = [[Restaurant alloc] init];
    no7.name = @"No. 7";
    no7.address = @"Fort Greene, Brooklyn";
    no7.cuisineType = @"Experimental American";
    no7.yearOpened = 2001;
    
    self.restaurants = [[NSMutableArray alloc] initWithObjects: piopio, no7, nil];
    
    Review* no7Review1 = [[Review alloc] init];
    no7Review1.text = @"Delicious!";
    no7Review1.reviewer = @"Bart";
    no7Review1.score = 5;
    no7Review1.numberOfHelpfulRatings = 10;
    no7Review1.numberOfunhelpfulRatings = 0;
    
    Review* no7Review2 = [[Review alloc] init];
    no7Review2.text = @"I love the fried broccoli with hoisin dippin sauce. Divine!";
    no7Review2.reviewer = @"Reagan Nixon";
    no7Review2.score = 4.5;
    no7Review2.numberOfHelpfulRatings = 6;
    no7Review2.numberOfunhelpfulRatings = 1;
    
    no7.reviews = [[NSMutableArray alloc] initWithObjects: no7Review1, no7Review2, nil];
 
}



- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
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
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return restaurants.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* cellIdentifier = @"RestaurantCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    Restaurant* currentRestaurant = [restaurants objectAtIndex:indexPath.row];
    cell.textLabel.text = currentRestaurant.name;
    cell.detailTextLabel.text = currentRestaurant.cuisineType;
    return cell;
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    DetailViewController* detailVC = (DetailViewController*)[segue destinationViewController];
    UITableView* table = [self tableView];
    NSIndexPath* indexPath = [table indexPathForSelectedRow];
    Restaurant* currentRestaurant = [restaurants objectAtIndex:indexPath.row];
    detailVC.restaurant = currentRestaurant;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

@end
