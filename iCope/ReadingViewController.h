//
//  ReadingViewController.h
//  BlueApp
//
//  Created by Costas Simiharv on 1/13/15.
//  Copyright (c) 2015 cvrahimis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Quotes.h"

@interface ReadingViewController : UIViewController
{
    int count;
}
@property (strong, nonatomic) IBOutlet UIImageView *background;
@property (strong, nonatomic) IBOutlet UILabel *quoteLbl;
@property (strong, nonatomic) NSArray *quotes;
@property (strong, nonatomic) IBOutlet UIButton *nextBtn;
- (IBAction)nextBtnPress:(id)sender;

@end
