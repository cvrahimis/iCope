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
    UIButton *musicBtn;
    UIImageView *contentImgView;
    UILabel *greetingLabel;
    NSString *name;
    NSString *morningGreeting;
    NSString *afternoonGreeting;
    NSString *eveningGreeting;
    NSInteger *currentTime;
}
//@property (strong, nonatomic) IBOutlet UIButton *musicBtn;
@property (strong, nonatomic) IBOutlet UIImageView *contentImgView;
@property (strong, nonatomic) IBOutlet UIButton *drawing;

- (IBAction)musicPress:(id)sender;
- (IBAction)drawingPress:(id)sender;
- (IBAction)journalPress:(id)sender;

-(id) init;

@end
