//
//  MainViewController.h
//  RippleEffect
//
//  Created by Costas Simiharv on 12/20/14.
//  Copyright (c) 2014 cvrahimis. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "SwipeViewController.h"
#import "RNSwipeViewController.h"

@interface MainViewController : RNSwipeViewController
<RNSwipeViewControllerDelegate>

-(id) init;

@end
