//
//  RatingViewController.h
//  iCope
//
//  Created by Brown on 2/12/15.
//  Copyright (c) 2015 cvrahimis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RatingViewController : UIViewController{
    NSInteger *currentTime;
    NSArray *emotionBtns;
}
@property (strong, nonatomic) IBOutlet UIImageView *background;
@property (strong, nonatomic) IBOutlet UIButton *Btn1;
@property (strong, nonatomic) IBOutlet UIButton *Btn2;
@property (strong, nonatomic) IBOutlet UIButton *Btn3;
@property (strong, nonatomic) IBOutlet UIButton *Btn4;
@property (strong, nonatomic) IBOutlet UIButton *Btn5;
@property (strong, nonatomic) IBOutlet UIButton *Btn6;
@property (strong, nonatomic) IBOutlet UIButton *Btn7;
@property (strong, nonatomic) IBOutlet UIButton *Btn8;
@property (strong, nonatomic) IBOutlet UIButton *Btn9;
@property (strong, nonatomic) IBOutlet UIButton *Btn10;
@property (strong, nonatomic) IBOutlet UIButton *Btn11;
@property (strong, nonatomic) IBOutlet UIButton *Btn12;
@property (strong, nonatomic) IBOutlet UIButton *doneBtn;

- (IBAction)BtnPress:(id)sender;


@end
