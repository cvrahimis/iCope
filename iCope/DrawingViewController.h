//
//  DrawingViewController.h
//  BlueApp
//
//  Created by Costas Simiharv on 1/13/15.
//  Copyright (c) 2015 cvrahimis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingsViewController.h"

@interface DrawingViewController : UIViewController <SettingsViewControllerDelegate, UIActionSheetDelegate> {
    
    CGPoint lastPoint;
    CGFloat red;
    CGFloat green;
    CGFloat blue;
    CGFloat brush;
    CGFloat opacity;
    BOOL mouseSwiped;
    UIButton *colorBtns[10];
    UIButton *topBtns[4];
    BOOL openSave;
    NSArray *colors;
}

@property (strong, nonatomic) UIImageView *mainImage;
@property (strong, nonatomic) UIImageView *tempDrawImage;
@property (strong, nonatomic) NSArray *colors;


- (IBAction)pencilPressed:(id)sender;
//- (IBAction)eraserPressed:(id)sender;
- (IBAction)reset:(id)sender;
- (void)settings;
- (IBAction)save:(id)sender;

@end