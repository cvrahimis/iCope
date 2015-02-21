//
//  HomeViewController.h
//  SwipeFunctionality
//
//  Created by Costas Simiharv on 12/31/14.
//  Copyright (c) 2014 cvrahimis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MusicViewController.h"
#import "DrawingViewController.h"
#import "JournalViewController.h"
#import "ExerciseTableViewController.h"
#import "ReadingViewController.h"
#import "RatingViewController.h"

@interface HomeViewController : UIViewController{
    UILabel *home;
    UIImageView *contentImgView;
    UILabel *greetingLbl;
    NSString *name;
    NSString *morningGreeting;
    NSString *afternoonGreeting;
    NSString *eveningGreeting;
    NSInteger *currentTime;
}

@property (strong, nonatomic) IBOutlet UILabel *greetingLbl;
@property (strong, nonatomic) IBOutlet UIImageView *contentImgView;
//@property (strong, nonatomic) IBOutlet UILabel *greetingLbl;
@property (strong, nonatomic) IBOutlet UIButton *musicBtn;
@property (strong, nonatomic) IBOutlet UIButton *readingBtn;
@property (strong, nonatomic) IBOutlet UIButton *drawingBtn;
@property (strong, nonatomic) IBOutlet UIButton *journalBtn;
@property (strong, nonatomic) IBOutlet UIButton *excerciseBtn;
@property (strong, nonatomic) IBOutlet UIButton *ratingBtn;

-(id) init;
- (IBAction)activityPress:(id)sender;

@end
