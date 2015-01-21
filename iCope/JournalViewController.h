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

@interface JournalViewController : UIViewController <OpenEntriesViewControllerDelegate>{
    NSString *title;
    NSString *entry;
}

@property (strong, nonatomic) IBOutlet UIImageView *background;
@property (strong, nonatomic) IBOutlet UITextField *titleTF;
@property (strong, nonatomic) IBOutlet UITextView *entryTV;
@property (strong, nonatomic) IBOutlet UIButton *saveBtn;
- (IBAction)savePress:(id)sender;
//- (void)closeOpenEntries:(id)sender;
@end
