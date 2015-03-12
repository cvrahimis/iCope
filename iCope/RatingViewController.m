//
//  RatingViewController.m
//  iCope
//
//  Created by Brown on 2/12/15.
//  Copyright (c) 2015 cvrahimis. All rights reserved.
//

#import "RatingViewController.h"

#define frameWidth self.view.frame.size.width
#define frameHeight self.view.frame.size.height

@interface RatingViewController ()

@end

@implementation RatingViewController
@synthesize background, doneBtn, topLbl, bottonLbl, okBtn, happyBtn, thermometer, mesurmentView;

-(id) init{
    if(self = [super init]){
        NSLog(@"%s ==== %f", __PRETTY_FUNCTION__, frameWidth);
        
        background = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frameWidth, frameHeight)];
        background.userInteractionEnabled = YES;
        self.view.userInteractionEnabled = YES;
        currentTime = [self Time];
        [self initBackground];
        [self.view addSubview:background];
        
        topLbl = [[UILabel alloc] initWithFrame: CGRectMake(0,0, frameWidth, frameHeight * .1)];
        topLbl.center = CGPointMake(frameWidth / 2, frameHeight * .1);
        topLbl.text = @"How do you feel?";
        topLbl.backgroundColor	= [UIColor clearColor];
        topLbl.font = [UIFont fontWithName: @"Baskerville-SemiBoldItalic" size: 35];
        topLbl.textAlignment = NSTextAlignmentCenter;
        topLbl.textColor = [UIColor whiteColor];
        [self.view addSubview: topLbl];
        
        
        int count = 0;
        NSArray *titles = @[@"Lonely", @"Shameful", @"Guilty", @"Disgusted", @"Angry", @"Anxious", @"Afraid", @"Sad", @"Depressed"];
        
        CGFloat width = frameWidth * .2;
        CGFloat height = frameHeight * .2;
        for (int row = 1;  row <= 3 ; row++)
        {
            for (int col = 1; col <= 3; col++)
            {
                emotionBtns[count] = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, frameWidth * .27, frameHeight * .07)];
                

                if (col == 2)
                    emotionBtns[count].center = CGPointMake(frameWidth /2, height);
                else
                    emotionBtns[count].center = CGPointMake(width, height);
                emotionBtns[count].backgroundColor = [UIColor colorWithRed:9 green:.9 blue:1 alpha:.3];
                emotionBtns[count].layer.cornerRadius = 10;
                emotionBtns[count].layer.borderWidth=1.0f;
                emotionBtns[count].layer.borderColor=[[UIColor colorWithRed:.7 green:.9 blue:1 alpha:1] CGColor];
                emotionBtns[count].tag = count;
                emotionBtns[count].showsTouchWhenHighlighted = YES;
                [emotionBtns[count] setTitleColor: [UIColor whiteColor] forState: UIControlStateNormal];
                [emotionBtns[count].titleLabel setFont:[UIFont systemFontOfSize: 18]];
                [emotionBtns[count] setTitle: [titles objectAtIndex: count] forState: UIControlStateNormal];
                
                emotionBtns[count].userInteractionEnabled = YES;
                
                [emotionBtns[count] addTarget:self action:@selector(btnPress:) forControlEvents:UIControlEventTouchUpInside];
                [self.view addSubview:emotionBtns[count]];
                
                [self.view bringSubviewToFront:emotionBtns[count]];
                
                width += width;
                count++;
            }
            width = frameWidth * .2;
            height += frameHeight * .08;
        }
        
        okBtn = [[UIButton alloc] initWithFrame:CGRectMake(0,0, frameWidth * .27, frameHeight * .07)];
        okBtn.center = CGPointMake(frameWidth * .35, height);
        okBtn.backgroundColor = [UIColor colorWithRed:.9 green:.9 blue:1 alpha:.3];
        okBtn.layer.cornerRadius = 10;
        okBtn.layer.borderWidth=1.0f;
        okBtn.layer.borderColor=[[UIColor colorWithRed:.7 green:.9 blue:1 alpha:1] CGColor];
        okBtn.tag = ++count;
        okBtn.showsTouchWhenHighlighted = YES;
        [okBtn setTitleColor: [UIColor whiteColor] forState: UIControlStateNormal];
        [okBtn.titleLabel setFont:[UIFont systemFontOfSize: 18]];
        [okBtn setTitle: @"Okay" forState: UIControlStateNormal];
        okBtn.userInteractionEnabled = YES;
        [okBtn addTarget:self action:@selector(btnPress:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:okBtn];
        [self.view bringSubviewToFront:okBtn];
        
        happyBtn = [[UIButton alloc] initWithFrame:CGRectMake(0,0, frameWidth * .27, frameHeight * .07)];
        happyBtn.center = CGPointMake(frameWidth * .65, height);
        happyBtn.backgroundColor = [UIColor colorWithRed:9 green:.9 blue:1 alpha:.3];
        happyBtn.layer.cornerRadius = 10;
        happyBtn.layer.borderWidth=1.0f;
        happyBtn.layer.borderColor=[[UIColor colorWithRed:.7 green:.9 blue:1 alpha:1] CGColor];
        happyBtn.tag = ++count;
        happyBtn.showsTouchWhenHighlighted = YES;
        [happyBtn setTitleColor: [UIColor whiteColor] forState: UIControlStateNormal];
        [happyBtn.titleLabel setFont:[UIFont systemFontOfSize: 18]];
        [happyBtn setTitle: @"Happy" forState: UIControlStateNormal];
        happyBtn.userInteractionEnabled = YES;
        [happyBtn addTarget:self action:@selector(btnPress:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:happyBtn];
        [self.view bringSubviewToFront:happyBtn];

        bottomLbl = [[UILabel alloc] initWithFrame: CGRectMake(0,0, frameWidth, frameHeight * .1)];
        bottomLbl.center = CGPointMake(frameWidth / 2, frameHeight * .55);
        bottomLbl.text = @"Urge to self injure?";
        bottomLbl.backgroundColor	= [UIColor clearColor];
        bottomLbl.font = [UIFont fontWithName: @"Baskerville-SemiBoldItalic" size: 35];
        bottomLbl.textAlignment = NSTextAlignmentCenter;
        bottomLbl.textColor = [UIColor whiteColor];
        [self.view addSubview: bottomLbl];
        
        mesurmentView = [[UIView alloc] initWithFrame:CGRectMake(frameWidth * .2, frameHeight * .672, frameWidth * .05, frameHeight * .055)];
        mesurmentView.backgroundColor = [UIColor redColor];
        [self.view addSubview:mesurmentView];
        
        thermometer = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frameWidth * .85, frameHeight * .08)];
        thermometer.center = CGPointMake(frameWidth / 2, frameHeight * .7);
        [thermometer setImage:[UIImage imageNamed:@"thermometer"]];
        thermometer.userInteractionEnabled = YES;
        [self.view addSubview:thermometer];
        
        doneBtn = [[UIButton alloc] initWithFrame:CGRectMake(0,0, frameWidth * .3, frameHeight * .08)];
        doneBtn.center = CGPointMake(frameWidth / 2, frameHeight * .9);
        doneBtn.backgroundColor = [UIColor colorWithRed:.75 green:1 blue:.75 alpha:.5];
        doneBtn.layer.cornerRadius = 10;
        doneBtn.layer.borderWidth=1.0f;
        doneBtn.layer.borderColor=[[UIColor colorWithRed:.7 green:.9 blue:1 alpha:1] CGColor];
        doneBtn.tag = ++count;
        doneBtn.showsTouchWhenHighlighted = YES;
        [doneBtn setTitleColor: [UIColor whiteColor] forState: UIControlStateNormal];
        [doneBtn.titleLabel setFont:[UIFont systemFontOfSize: 18]];
        [doneBtn setTitle: @"Done" forState: UIControlStateNormal];
        doneBtn.userInteractionEnabled = YES;
        [doneBtn addTarget:self action:@selector(btnPress:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:doneBtn];
        [self.view bringSubviewToFront:doneBtn];
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%s", __PRETTY_FUNCTION__);
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
    self.navigationController.navigationBar.translucent = YES;
    [[self navigationController] setNavigationBarHidden:YES animated:NO];
}

-(long) Time {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH"];
    NSString *timeOfDayInHoursString = [dateFormatter stringFromDate:date];
    long timeOfDayInHours = [timeOfDayInHoursString integerValue];
    return timeOfDayInHours;
}

- (void)btnPress:(id)sender {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    switch (((UIButton*)sender).tag) {
        case 0:
        {
            NSLog(@"%s button 0", __PRETTY_FUNCTION__);
            if (selectedBtn != nil) {
                selectedBtn.backgroundColor = [UIColor colorWithRed:.9 green:.9 blue:1 alpha:.3];
                selectedBtn.layer.borderColor=[[UIColor colorWithRed:.7 green:.9 blue:1 alpha:1] CGColor];
                selectedBtn = sender;
            }
            selectedBtn = sender;
            selectedBtn.backgroundColor = [UIColor colorWithRed:.75 green:1 blue:.75 alpha:.5];
            break;
        }
        case 1:
        {
            NSLog(@"%s button 1", __PRETTY_FUNCTION__);
            if (selectedBtn != nil) {
                selectedBtn.backgroundColor = [UIColor colorWithRed:.9 green:.9 blue:1 alpha:.3];
                selectedBtn.layer.borderColor=[[UIColor colorWithRed:.7 green:.9 blue:1 alpha:1] CGColor];
                selectedBtn = sender;
            }
            selectedBtn = sender;
            selectedBtn.backgroundColor = [UIColor colorWithRed:.75 green:1 blue:.75 alpha:.5];
            break;
        }
        case 2:
        {
            NSLog(@"%s button 2", __PRETTY_FUNCTION__);
            if (selectedBtn != nil) {
                selectedBtn.backgroundColor = [UIColor colorWithRed:.9 green:.9 blue:1 alpha:.3];
                selectedBtn.layer.borderColor=[[UIColor colorWithRed:.7 green:.9 blue:1 alpha:1] CGColor];
                selectedBtn = sender;
            }
            selectedBtn = sender;
            selectedBtn.backgroundColor = [UIColor colorWithRed:.75 green:1 blue:.75 alpha:.5];
            break;
        }
        case 3:
        {
            NSLog(@"%s button 3", __PRETTY_FUNCTION__);
            if (selectedBtn != nil) {
                selectedBtn.backgroundColor = [UIColor colorWithRed:.9 green:.9 blue:1 alpha:.3];
                selectedBtn.layer.borderColor=[[UIColor colorWithRed:.7 green:.9 blue:1 alpha:1] CGColor];
                selectedBtn = sender;
            }
            selectedBtn = sender;
            selectedBtn.backgroundColor = [UIColor colorWithRed:.75 green:1 blue:.75 alpha:.5];
            break;
        }
        case 4:
        {
            NSLog(@"%s button 4", __PRETTY_FUNCTION__);
            if (selectedBtn != nil) {
                selectedBtn.backgroundColor = [UIColor colorWithRed:.9 green:.9 blue:1 alpha:.3];
                selectedBtn.layer.borderColor=[[UIColor colorWithRed:.7 green:.9 blue:1 alpha:1] CGColor];
                selectedBtn = sender;
            }
            selectedBtn = sender;
            selectedBtn.backgroundColor = [UIColor colorWithRed:.75 green:1 blue:.75 alpha:.5];
            break;
        }
        case 5:
        {
            NSLog(@"%s button 5", __PRETTY_FUNCTION__);
            if (selectedBtn != nil) {
                selectedBtn.backgroundColor = [UIColor colorWithRed:.9 green:.9 blue:1 alpha:.3];
                selectedBtn.layer.borderColor=[[UIColor colorWithRed:.7 green:.9 blue:1 alpha:1] CGColor];
                selectedBtn = sender;
            }
            selectedBtn = sender;
            selectedBtn.backgroundColor = [UIColor colorWithRed:.75 green:1 blue:.75 alpha:.5];
            break;
        }
        case 6:
        {
            NSLog(@"%s button 6", __PRETTY_FUNCTION__);
            if (selectedBtn != nil) {
                selectedBtn.backgroundColor = [UIColor colorWithRed:.9 green:.9 blue:1 alpha:.3];
                selectedBtn.layer.borderColor=[[UIColor colorWithRed:.7 green:.9 blue:1 alpha:1] CGColor];
                selectedBtn = sender;
            }
            selectedBtn = sender;
            selectedBtn.backgroundColor = [UIColor colorWithRed:.75 green:1 blue:.75 alpha:.5];
            break;
        }
        case 7:
        {
            NSLog(@"%s button 7", __PRETTY_FUNCTION__);
            if (selectedBtn != nil) {
                selectedBtn.backgroundColor = [UIColor colorWithRed:.9 green:.9 blue:1 alpha:.3];
                selectedBtn.layer.borderColor=[[UIColor colorWithRed:.7 green:.9 blue:1 alpha:1] CGColor];
                selectedBtn = sender;
            }
            selectedBtn = sender;
            selectedBtn.backgroundColor = [UIColor colorWithRed:.75 green:1 blue:.75 alpha:.5];
            break;
        }
        case 8:
        {
            NSLog(@"%s button 8", __PRETTY_FUNCTION__);
            if (selectedBtn != nil) {
                selectedBtn.backgroundColor = [UIColor colorWithRed:.9 green:.9 blue:1 alpha:.3];
                selectedBtn.layer.borderColor=[[UIColor colorWithRed:.7 green:.9 blue:1 alpha:1] CGColor];
                selectedBtn = sender;
            }
            selectedBtn = sender;
            selectedBtn.backgroundColor = [UIColor colorWithRed:.75 green:1 blue:.75 alpha:.5];
            break;
        }
        case 9:
        {
            NSLog(@"%s button 9", __PRETTY_FUNCTION__);
            if (selectedBtn != nil) {
                selectedBtn.backgroundColor = [UIColor colorWithRed:.9 green:.9 blue:1 alpha:.3];
                selectedBtn.layer.borderColor=[[UIColor colorWithRed:.7 green:.9 blue:1 alpha:1] CGColor];
                selectedBtn = sender;
            }
            selectedBtn = sender;
            selectedBtn.backgroundColor = [UIColor colorWithRed:.75 green:1 blue:.75 alpha:.5];
            break;
        }
        case 10:
        {
            NSLog(@"%s button 10", __PRETTY_FUNCTION__);
            if (selectedBtn != nil) {
                selectedBtn.backgroundColor = [UIColor colorWithRed:.9 green:.9 blue:1 alpha:.3];
                selectedBtn.layer.borderColor=[[UIColor colorWithRed:.7 green:.9 blue:1 alpha:1] CGColor];
                selectedBtn = sender;
            }
            selectedBtn = sender;
            selectedBtn.backgroundColor = [UIColor colorWithRed:.75 green:1 blue:.75 alpha:.5];
            break;
        }
        case 11:
        {
            NSLog(@"%s button 11", __PRETTY_FUNCTION__);
            if (selectedBtn != nil) {
                selectedBtn.backgroundColor = [UIColor colorWithRed:.9 green:.9 blue:1 alpha:.3];
                selectedBtn.layer.borderColor=[[UIColor colorWithRed:.7 green:.9 blue:1 alpha:1] CGColor];
                selectedBtn = sender;
            }
            selectedBtn = sender;
            selectedBtn.backgroundColor = [UIColor colorWithRed:.75 green:1 blue:.75 alpha:.5];
            break;
        }
        case 12:
        {
            NSLog(@"%s button 12", __PRETTY_FUNCTION__);
            UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main"
                                                                     bundle: nil];
            MainViewController *mvc = [mainStoryboard instantiateViewControllerWithIdentifier:@"mainViewController"];
            UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:mvc];
            
            //now present this navigation controller modally
            [self presentViewController:navigationController
                               animated:YES
                             completion:nil];
            break;
        }
        default:
            break;
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if ([[event allTouches] count] == 1)
    {
        pos = [[touches anyObject] locationInView: thermometer];
        swiped = NO;
    }
}


- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    CGPoint current = [[touches anyObject] locationInView: thermometer];
    if ((pos.x - current.x) < 0)
    {
        if (mesurmentView.frame.size.width + 5 > frameWidth * .722)
            mesurmentView.frame = CGRectMake(frameWidth * .2, frameHeight * .671, frameWidth * .722, mesurmentView.frame.size.height);
        else
            mesurmentView.frame = CGRectMake(frameWidth * .2, frameHeight * .671, mesurmentView.frame.size.width + 5, mesurmentView.frame.size.height);
    }
    else
    {
        if (mesurmentView.frame.size.width -5 < 1)
            mesurmentView.frame = CGRectMake(frameWidth * .2, frameHeight * .671, 1, mesurmentView.frame.size.height);
        else
            mesurmentView.frame = CGRectMake(frameWidth * .2, frameHeight * .671 , mesurmentView.frame.size.width -5, mesurmentView.frame.size.height);
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    }



@end
