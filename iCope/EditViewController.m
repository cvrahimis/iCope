//
//  EditViewController.m
//  VehicleDB
//
//  Created by Costas on 11/5/14.
//  Copyright (c) 2014 Costas. All rights reserved.
//

#import "EditViewController.h"

#define frameWidth self.view.frame.size.width
#define frameHeight self.view.frame.size.height

@implementation EditViewController
@synthesize eName;
@synthesize reps;
@synthesize weight;
@synthesize sets;
@synthesize done;
//@synthesize context;
//@synthesize workoutHist;
@synthesize dates;

- (id) init
{
    if (self = [super init])
    {
        background = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frameWidth, frameHeight)];
        background.image = [UIImage imageNamed:@"GymWeights.png"];
        [self.view addSubview: background];        
        
        eName = [[UITextField alloc] initWithFrame: CGRectMake(frameWidth*.25, frameHeight * .22, frameWidth*.5, 30)];
        eName.borderStyle = UITextBorderStyleRoundedRect;
        eName.textColor = [UIColor redColor];
        eName.placeholder = @"Exercise Name";
        eName.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        eName.delegate = self;
        [self.view addSubview: eName];
        
        reps = [[UITextField alloc] initWithFrame: CGRectMake(frameWidth*.25, frameHeight * .29, frameWidth*.5, 30)];
        reps.borderStyle = UITextBorderStyleRoundedRect;
        reps.textColor = [UIColor redColor];
        reps.placeholder = @"Reps";
        reps.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        reps.delegate = self;
        [self.view addSubview: reps];
        
        sets = [[UITextField alloc] initWithFrame: CGRectMake(frameWidth*.25, frameHeight * .36, frameWidth*.5, 30)];
        sets.borderStyle = UITextBorderStyleRoundedRect;
        sets.textColor = [UIColor redColor];
        sets.placeholder = @"Sets";
        sets.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        sets.delegate = self;
        [self.view addSubview: sets];
        
        weight = [[UITextField alloc] initWithFrame: CGRectMake(frameWidth*.25, frameHeight * .43, frameWidth*.5, 30)];
        weight.borderStyle = UITextBorderStyleRoundedRect;
        weight.textColor = [UIColor redColor];
        weight.delegate = self;
        weight.placeholder = @"Weight";
        weight.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [self.view addSubview: weight];        
        
        done = [UIButton buttonWithType: UIButtonTypeRoundedRect];
        done.frame = CGRectMake(0, 0, 120, 40);
        done.center = CGPointMake(frameWidth/2.0, frameHeight - 50);
        done.opaque = YES;
        done.layer.cornerRadius = 12;
        done.clipsToBounds = YES;
        done.backgroundColor = [UIColor blueColor];
        done.tintColor = [UIColor whiteColor];
        [done setTitleColor: [UIColor whiteColor] forState: UIControlStateNormal];
        [done.titleLabel setFont:[UIFont systemFontOfSize: 22]];
        [done setTitle:@"Done" forState:UIControlStateNormal];
        [done addTarget:self action:@selector(finishedEditing) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview: done];
        
    }
    NSLog(@"%s", __PRETTY_FUNCTION__);
    return self;
}

- (void) finishedEditing
{
  /*  NSDateFormatter *dateformate=[[NSDateFormatter alloc]init];
    [dateformate setDateFormat:@"dd/MM/YYYY"];
    
    workoutHist.date = [dateformate stringFromDate:[NSDate date]];
    workoutHist.exerciseName = eName.text;
    workoutHist.reps = [NSNumber numberWithFloat: [reps.text integerValue]];
    workoutHist.weight = [NSNumber numberWithFloat: [weight.text integerValue]];
    workoutHist.sets = [NSNumber numberWithFloat: [sets.text integerValue]];
    
    NSManagedObjectContext *context = workoutHist.managedObjectContext;
    NSError *error = nil;
    [context save: &error];
    
    [self.navigationController popViewControllerAnimated: YES];
    */
}

- (void) viewWillAppear: (BOOL) animated
{
    [super viewWillAppear: animated];

   /* eName.text = workoutHist.exerciseName;
    if([workoutHist.reps integerValue] > 0)
    {
        reps.text = [NSString stringWithFormat: @"%li", (long)[workoutHist.reps integerValue]];
    }
    if([workoutHist.weight integerValue] > 0)
    {
        weight.text = [NSString stringWithFormat: @"%li", (long)[workoutHist.weight integerValue]];
    }
    if([workoutHist.sets integerValue] > 0)
    {
        sets.text = [NSString stringWithFormat: @"%li", (long)[workoutHist.sets integerValue]];
    }
    */
}

- (void)viewWillDisappear:(BOOL)animated
{
    //[self finishedEditing];
}

- (void) textFieldDidEndEditing: (UITextField *) txtField
{
    /*if (txtField == eName)
        //workoutHist.exerciseName = txtField.text;
    else if (txtField == reps)
        //workoutHist.reps = [NSNumber numberWithFloat: [txtField.text integerValue]];
    else if (txtField == weight)
        //workoutHist.weight = [NSNumber numberWithFloat: [txtField.text integerValue]];
    else if (txtField == sets)
        //workoutHist.sets = [NSNumber numberWithFloat: [txtField.text integerValue]];
     */
}

- (BOOL) textFieldShouldReturn: (UITextField *) txtField {
    [txtField resignFirstResponder];
    return YES;
}

@end

