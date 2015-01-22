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

-(id) init;
- (IBAction)activityPress:(id)sender;

@end
