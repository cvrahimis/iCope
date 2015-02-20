//
//  RatingViewController.m
//  iCope
//
//  Created by Brown on 2/12/15.
//  Copyright (c) 2015 cvrahimis. All rights reserved.
//

#import "RatingViewController.h"

@interface RatingViewController ()

@end

@implementation RatingViewController
@synthesize background, doneBtn, Btn1, Btn2, Btn3, Btn4, Btn5, Btn6, Btn7, Btn8, Btn9, Btn10, Btn11, Btn12;

- (void)viewDidLoad {
    [super viewDidLoad];
    currentTime = [self Time];
    [self initBackground];
    [self initUiElements];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) initBackground {
    if (currentTime < 12) background.image = [UIImage imageNamed:@"Morning"];
    else if (currentTime > 12 && currentTime < 18) background.image = [UIImage imageNamed:@"Afternoon"];
    else background.image = [UIImage imageNamed:@"Evening"];
}

-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"%s",__PRETTY_FUNCTION__);
    self.navigationItem.title = @"Rating Screen";
    self.navigationController.navigationBar.translucent = NO;
    [[self navigationController] setNavigationBarHidden:YES animated:NO];
}

-(NSInteger *) Time {
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH"];
    NSString *timeOfDayInHoursString = [dateFormatter stringFromDate:date];
    NSInteger *timeOfDayInHours = [timeOfDayInHoursString integerValue];
    return timeOfDayInHours;
}

-(void) initUiElements {
    emotionBtns = [[NSArray alloc] initWithObjects:doneBtn, Btn1, Btn2, Btn3, Btn4, Btn5, Btn6, Btn7, Btn8, Btn9, Btn10, Btn11, Btn12,nil];
    for (int i = 0; i < sizeof(emotionBtns); i++) {
        UIButton *anEmotionBtn = [emotionBtns objectAtIndex:i];
        anEmotionBtn.layer.cornerRadius = 10;
        anEmotionBtn.layer.borderWidth=1.0f;
        anEmotionBtn.layer.borderColor=[[UIColor whiteColor] CGColor];
    }
}

- (IBAction)BtnPress:(id)sender {
    switch (((UIButton*)sender).tag) {
        case 0:
        {
        }
        case 1:
        {
        }
        case 2:
        {
        }
        case 3:
        {
        }
        case 4:
        {
        }
        case 5:
        {
        }
        case 6:
        {
        }
        case 7:
        {
        }
        case 8:
        {
        }
        case 9:
        {
        }
        case 10:
        {
        }
        case 11:
        {
        }
        case 12:
        {
        }
        case 13:
        {
            [self.navigationController dismissViewControllerAnimated:YES completion:nil];
        }
        default:
            break;
    }
}
@end
