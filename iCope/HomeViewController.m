//
//  HomeViewController.m
//  SwipeFunctionality
//
//  Created by Costas Simiharv on 12/31/14.
//  Copyright (c) 2014 cvrahimis. All rights reserved.
//

#import "HomeViewController.h"
#import "UIViewController+RNSwipeViewController.h"
//#import "SwipeViewController.h"
#import "RNSwipeViewController.h"
#define frameWidth self.view.frame.size.width
#define frameHeight self.view.frame.size.height

@interface HomeViewController ()

@end

@implementation HomeViewController
//@synthesize musicBtn;
@synthesize contentImgView;

-(id) init{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    if(self = [super init])
    {
        
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        NSLog(@"%s",__PRETTY_FUNCTION__);
    }
    return self;
}

-(void) initBackground {
    if (currentTime < 12) contentImgView.image = [UIImage imageNamed:@"Morning"];
    else if (currentTime > 12 && currentTime < 18) contentImgView.image = [UIImage imageNamed:@"Afternoon"];
    else contentImgView.image = [UIImage imageNamed:@"Evening"];
    //[self.view addSubview: morningBackground];
    
}

// Method so strings only have to be created once.
-(void) initStrings {
    name = @"Michael"; // User should set their name upon completion of first time setup.
    morningGreeting = [NSString stringWithFormat:@"Good Morning %@", name];
    afternoonGreeting = [NSString stringWithFormat:@"Good Afternoon %@", name];
    eveningGreeting = [NSString stringWithFormat:@"Good Evening %@", name];
}

-(void) initLabels {
    
    greetingLabel = [[UILabel alloc] initWithFrame: CGRectMake(0, 0, frameWidth, frameHeight * .2)];
    greetingLabel.center = CGPointMake(frameWidth * .5, frameHeight * .2);
    greetingLabel.text = [self Greeting];
    greetingLabel.textAlignment = NSTextAlignmentCenter;
    greetingLabel.numberOfLines = 2;
    greetingLabel.font = [UIFont fontWithName: @"Courier-BoldOblique" size: 40];
    greetingLabel.textColor = [UIColor whiteColor];
    [self.view addSubview: greetingLabel];
    
}

// Method returns todays current hour.
-(NSInteger *) Time {
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH"];
    NSString *timeOfDayInHoursString = [dateFormatter stringFromDate:date];
    NSInteger *timeOfDayInHours = [timeOfDayInHoursString integerValue];
    return timeOfDayInHours;
}

-(NSString *) Greeting {
    if (currentTime < 12) return morningGreeting;
    else if (currentTime > 12 && currentTime < 18) return afternoonGreeting;
    else return eveningGreeting;
}

// Returns greeting message based on time of day.
-(NSString *) Greeting:(int)timeOfDayInHours {
    if (timeOfDayInHours < 12) return morningGreeting;
    else if (timeOfDayInHours > 12 && timeOfDayInHours < 18) return afternoonGreeting;
    else return eveningGreeting;
}

- (void)viewDidLoad {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    currentTime = [self Time];
    [self initBackground];
    [self initStrings];
    [self initLabels];
    //background.userInteractionEnabled = YES;
    //contentView.frame = CGRectMake(0, 0, frameWidth, frameHeight);
}


- (IBAction)musicPress:(id)sender{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    MusicViewController *musicVC = [[MusicViewController alloc] init];
    [self.navigationController pushViewController:musicVC animated:YES];
}

- (IBAction)drawingPress:(id)sender {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    DrawingViewController *draw = [[DrawingViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:draw];
    
    //now present this navigation controller modally
    [self presentViewController:navigationController
                       animated:YES
                     completion:nil];
    //[self.navigationController presentViewController:draw animated:YES completion:nil];
}

- (IBAction)journalPress:(id)sender {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    JournalViewController *journal = [self.storyboard instantiateViewControllerWithIdentifier:@"journalViewController"];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:journal];
    
    //now present this navigation controller modally
    [self presentViewController:navigationController
                       animated:YES
                     completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillAppear: (BOOL) animated
{
    [super viewWillAppear: animated];
    self.navigationItem.title = @"Home";
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
    
}

-(void) viewDidAppear:(BOOL)animated
{
    NSLog(@"%s==========================", __PRETTY_FUNCTION__);
    //[background bringSubviewToFront:musicBtn];
}




@end
