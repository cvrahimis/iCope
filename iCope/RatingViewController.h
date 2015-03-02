//
//  RatingViewController.h
//  iCope
//
//  Created by Brown on 2/12/15.
//  Copyright (c) 2015 cvrahimis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"

@interface RatingViewController : UIViewController{
    NSInteger *currentTime;
    UIButton *emotionBtns[9];
    UIImageView *background;
    UIButton *doneBtn;
    UIButton *selectedBtn;
    UILabel *topLbl;
    UILabel *bottomLbl;
    UIButton *okBtn;
    UIButton *happyBtn;
    UIImageView *thermometer;
    UIView *mesurmentView;
    CGPoint pos;
    BOOL swiped;
}

@property (strong, nonatomic) UIImageView *background;
@property (strong, nonatomic) UIButton *doneBtn;
@property (strong, nonatomic) UILabel *topLbl;
@property (strong, nonatomic) UILabel *bottonLbl;
@property (strong, nonatomic) UIButton *okBtn;
@property (strong, nonatomic) UIButton *happyBtn;
@property (strong, nonatomic) UIImageView *thermometer;
@property (strong, nonatomic) UIView *mesurmentView;


@end
