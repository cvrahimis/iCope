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
#import <QuartzCore/QuartzCore.h>
#define frameWidth self.view.frame.size.width
#define frameHeight self.view.frame.size.height

@interface HomeViewController ()

@end

@implementation HomeViewController

@synthesize bec;
@synthesize greetingLbl;
@synthesize musicBtn;
@synthesize readingBtn;
@synthesize drawingBtn;
@synthesize journalBtn;
@synthesize excerciseBtn;
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
}

// Method so strings only have to be created once.
-(void) initStrings {
    if ([bec isPatientAndTherapistOnDevice]) {
        Patient *patient = [bec getPatientOnDevice];
        name = [@" " stringByAppendingString:[patient valueForKey:@"patientFirstName"]];
    }
    else
        name = @"";
    
    morningGreeting = [[NSString stringWithFormat:@"Good Morning"] stringByAppendingString:name];
    afternoonGreeting = [[NSString stringWithFormat:@"Good Afternoon"] stringByAppendingString:name];
    eveningGreeting = [[NSString stringWithFormat:@"Good Evening"] stringByAppendingString:name];
}

-(void) initLabels {
    greetingLbl = [[UILabel alloc] initWithFrame: CGRectMake(0, 0, frameWidth, frameHeight * .2)];
    greetingLbl.center = CGPointMake(frameWidth * .5, frameHeight * .2);
    greetingLbl.text = [self Greeting];
    greetingLbl.textAlignment = NSTextAlignmentCenter;
    greetingLbl.numberOfLines = 2;
    greetingLbl.font = [UIFont fontWithName: @"Courier-BoldOblique" size: 40];
    greetingLbl.textColor = [UIColor whiteColor];
    [self.view addSubview: greetingLbl];
}

-(void) initButtons {
    musicBtn.layer.cornerRadius = 10;
    readingBtn.layer.cornerRadius = 10;
    drawingBtn.layer.cornerRadius = 10;
    journalBtn.layer.cornerRadius = 10;
    excerciseBtn.layer.cornerRadius = 10;
    musicBtn.clipsToBounds = YES;
    readingBtn.clipsToBounds = YES;
    drawingBtn.clipsToBounds = YES;
    journalBtn.clipsToBounds = YES;
    excerciseBtn.clipsToBounds = YES;
}

// Method returns todays current hour.
-(int) Time {
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH"];
    NSString *timeOfDayInHoursString = [dateFormatter stringFromDate:date];
    int timeOfDayInHours = [timeOfDayInHoursString integerValue];
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
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    bec = [[BackEndComunicator alloc] initWithManagedObjectContext:appDelegate.managedObjectContext];
    
    currentTime = [self Time];
    [self initBackground];
    [self initStrings];
    [self initLabels];
    [self initButtons];
}

- (IBAction)activityPress:(id)sender {
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    switch (((UIButton*)sender).tag) {
        case 0:
        {
            NSLog(@"%s ================== Music Button Pressed", __PRETTY_FUNCTION__);
            MusicViewController *musicVC = [[MusicViewController alloc] init];
            UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:musicVC];
            [self.navigationController popToRootViewControllerAnimated:YES];
            //now present this navigation controller modally
            [self presentViewController:navigationController
                               animated:YES
                             completion:nil];
            break;
        }
        case 1:
        {
            NSLog(@"%s ================== Reading Button Pressed", __PRETTY_FUNCTION__);
            ReadingViewController *readingVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"readingViewController"];
            UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:readingVC];
            [self.navigationController popToRootViewControllerAnimated:YES];
            //now present this navigation controller modally
            [self presentViewController:navigationController
                               animated:YES
                             completion:nil];
            
            break;
        }
        case 2:
        {
            NSLog(@"%s ================== Drawing Button Pressed", __PRETTY_FUNCTION__);
            DrawingViewController *draw = [[DrawingViewController alloc] init];
            UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:draw];
            [self.navigationController popToRootViewControllerAnimated:YES];
            //now present this navigation controller modally
            [self presentViewController:navigationController
                               animated:YES
                             completion:nil];
            //[self.navigationController presentViewController:draw animated:YES completion:nil];
            break;
        }
        case 3:
        {
            NSLog(@"%s ================== Journal Button Pressed", __PRETTY_FUNCTION__);
            JournalViewController *journal = [mainStoryboard instantiateViewControllerWithIdentifier:@"journalViewController"];
            UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:journal];
            [self.navigationController popToRootViewControllerAnimated:YES];
            //now present this navigation controller modally
            [self presentViewController:navigationController
                               animated:YES
                             completion:nil];
            break;
        }
        case 4:
        {
            NSLog(@"%s ================== Exercise Button Pressed", __PRETTY_FUNCTION__);
            ExerciseTableViewController *exerciseTVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"exerciseTableViewController"];
            UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:exerciseTVC];
            [self.navigationController popToRootViewControllerAnimated:YES];
            //now present this navigation controller modally
            [self presentViewController:navigationController
                               animated:YES
                             completion:nil];
            break;
        }
        case 5:
        {
            NSLog(@"%s ================== Rating Button Pressed", __PRETTY_FUNCTION__);
            RatingViewController *ratingVC = [[RatingViewController alloc] init];
            [self.navigationController pushViewController:ratingVC animated:YES];
            break;
        }
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillAppear: (BOOL) animated
{
    [super viewWillAppear: animated];    
}

-(void) viewDidAppear:(BOOL)animated
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    //[background bringSubviewToFront:musicBtn];
}




@end
