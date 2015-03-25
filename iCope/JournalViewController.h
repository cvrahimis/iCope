//
//  JournalViewController.h
//  BlueApp
//
//  Created by Costas Simiharv on 1/13/15.
//  Copyright (c) 2015 cvrahimis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Journal.h"
#import "AppDelegate.h"
#import "OpenEntriesViewController.h"
#import "OpenEntriesViewControllerDelegate.h"
#import "RatingViewController.h"

@interface JournalViewController : UIViewController <OpenEntriesViewControllerDelegate, UITextViewDelegate>{
    NSString *title;
    NSString *entry;
    long currentTime;
    NSDate *startTime;
    NSDate *endTime;
}

@property (strong, nonatomic) IBOutlet UIImageView *background;
@property (strong, nonatomic) IBOutlet UITextField *titleTF;
@property (strong, nonatomic) IBOutlet UITextView *entryTV;
@property (strong, nonatomic) IBOutlet UIButton *saveBtn;
@property (strong, nonatomic) NSDate *startTime;
@property (strong, nonatomic) NSDate *endTime;
- (IBAction)savePress:(id)sender;
//- (void)closeOpenEntries:(id)sender;
@end
