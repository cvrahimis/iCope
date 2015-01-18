//
//  MachinesViewController.h
//  Pumped
//
//  Created by Costas Simiharv on 12/6/14.
//  Copyright (c) 2014 cvrahimis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieViewController.h"
#import "MusicViewController.h"
//#import "WorkoutSumHistory.h"
#import "WorkoutSumViewController.h"

@interface MachinesViewController : UIViewController<UINavigationControllerDelegate,UITextFieldDelegate>
{
    NSArray *equiptment;
    UIScrollView *scrollView;
    NSMutableArray *containerViews;
    NSManagedObjectContext *managedObjectContext;
    UIImageView *background;
    MovieViewController *mv;
//    WorkoutSumHistory *wsh;
    UIImageView *image;
    UIImage *imgName;
    UILabel *caption;
    UILabel *header;
    NSMutableArray *playButtons;
    UIButton *musicBTN;
    UIButton *summaryBTN;
}

@property (nonatomic, strong) NSArray *equiptment;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) UIImageView *background;
@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UIImageView *image;
@property (nonatomic, strong) UIImage *imgName;
@property (nonatomic, strong) UILabel *caption;
@property (nonatomic, strong) UILabel *header;
@property (nonatomic, strong) NSMutableArray *containerViews;
@property (nonatomic, strong) NSMutableArray *playButtons;
@property (nonatomic, strong) UIButton *musicBTN;
@property (nonatomic, strong) UIButton *summaryBTN;

- (id) initWithArray:(NSArray*) equipt;


@end
