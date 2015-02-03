//
//  MainViewController.m
//  RippleEffect
//
//  Created by Costas Simiharv on 12/20/14.
//  Copyright (c) 2014 cvrahimis. All rights reserved.
//

#import "MainViewController.h"
#import "HomeViewController.h"
#import "LeftViewController.h"
#import "RightViewController.h"

#define frameWidth self.view.frame.size.width
#define frameHeight self.view.frame.size.height

@implementation MainViewController

-(id) init{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    if(self = [super init])
    {
    }
    return self;
}

- (void)viewDidLoad {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [super viewDidLoad];

    /*self.centerViewController = [[HomeViewController alloc] init];
    self.leftViewController = [[LeftViewController alloc] init];
    self.rightViewController = [[RightViewController alloc] init];*/
    self.centerViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"centerViewController"];
    
    LeftViewController *leftViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"leftViewController"];
    NSArray *leftSubViews = [leftViewController.view subviews];
    if(leftSubViews.count > 3)
    {
        self.leftViewController = leftViewController;
        self.leftVisibleWidth = frameWidth;
    }
    
    RightViewController *rightViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"rightViewController"];
    NSArray *rightSubViews = [rightViewController.view subviews];
    if(rightSubViews.count > 3)
    {
        self.rightViewController = rightViewController;
        self.rightVisibleWidth = frameWidth;
    }
    
    self.swipeDelegate = self;

    //self.navigationItem.title = @"Home";
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Swipe delegate

- (void)swipeController:(RNSwipeViewController *)swipeController willShowController:(UIViewController *)controller {
    NSLog(@"%s",__PRETTY_FUNCTION__);
}

- (void)swipeController:(RNSwipeViewController *)swipeController didShowController:(UIViewController *)controller {
    NSLog(@"%s",__PRETTY_FUNCTION__);
}


@end
