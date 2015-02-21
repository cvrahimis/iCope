//
//  ReadingViewController.m
//  BlueApp
//
//  Created by Costas Simiharv on 1/13/15.
//  Copyright (c) 2015 cvrahimis. All rights reserved.
//

#import "ReadingViewController.h"
#define frameWidth self.view.frame.size.width
#define frameHeight self.view.frame.size.height

@implementation ReadingViewController
@synthesize background;
@synthesize quoteLbl;
@synthesize quotes;
@synthesize nextBtn;
@synthesize authorLbl;

- (void)viewDidLoad {
    [super viewDidLoad];
    count = 0;
    currentTime = [self Time];
    quoteLbl = [[UILabel alloc] initWithFrame:CGRectMake((frameWidth / 2) - ((frameWidth * .95) / 2), self.navigationController.navigationBar.frame.size.height, frameWidth * .95, frameHeight * .6)];
    
    
    authorLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frameWidth * .95, frameHeight * .2)];
    authorLbl.center = CGPointMake(frameWidth / 2, frameHeight * .8);
    [self initBackground];
    [self initQuotes];
    [self initLabels];
    [self.view addSubview:quoteLbl];
    [self.view addSubview:authorLbl];
}

-(void) initBackground {
    if (currentTime < 12) background.image = [UIImage imageNamed:@"Morning"];
    else if (currentTime > 12 && currentTime < 18) background.image = [UIImage imageNamed:@"Afternoon"];
    else background.image = [UIImage imageNamed:@"Evening"];
}

-(void) initQuotes {
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *managedObjectContext = appDelegate.managedObjectContext;
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Quotes" inManagedObjectContext: managedObjectContext];
    [fetchRequest setEntity:entity];
    NSError *error = nil;
    quotes = [managedObjectContext executeFetchRequest:fetchRequest error: &error];
    
    if (quotes != nil) [self formatLabels];
}

-(void) initLabels {
    quoteLbl.font = [UIFont fontWithName: @"Cochin-BoldItalic" size: 30];
    authorLbl.font = [UIFont fontWithName: @"Cochin-BoldItalic" size: 20];
    quoteLbl.textAlignment = NSTextAlignmentCenter;
    authorLbl.textAlignment = NSTextAlignmentCenter;
    //quoteLbl.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.3];
}

-(void) formatLabels {
    q = [quotes objectAtIndex:count];
    aQuote = [q valueForKey:@"quote"];
    lineCount = [aQuote length]/15+1;
    quoteLbl.numberOfLines = lineCount;
    [UIView transitionWithView:quoteLbl duration:.7f options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionTransitionFlipFromTop animations:^{
        quoteLbl.text = aQuote;
        authorLbl.text = [q valueForKey:@"author"];
    } completion:nil];
    if (count < quotes.count-1) count++;
    else count = 0;
}

-(NSInteger *) Time {
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH"];
    NSString *timeOfDayInHoursString = [dateFormatter stringFromDate:date];
    NSInteger *timeOfDayInHours = [timeOfDayInHoursString integerValue];
    return timeOfDayInHours;
}

-(void) done{
    RatingViewController *rvc = [[RatingViewController alloc]init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:rvc];
    
    //now present this navigation controller modally
    [self presentViewController:navigationController
                       animated:YES
                     completion:nil];
}

-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"%s",__PRETTY_FUNCTION__);
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]
                                             initWithTitle:@"Done"
                                             style:UIBarButtonItemStyleDone
                                             target:self
                                             action:@selector(done)];
    
    self.navigationItem.title = @"Reading";
    self.navigationController.navigationBar.translucent = NO;
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)nextBtnPress:(id)sender {
    [self formatLabels];
}
@end
