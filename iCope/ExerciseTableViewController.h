//
//  ExerciseTableViewController.h
//  iCope
//
//  Created by Costas Simiharv on 1/25/15.
//  Copyright (c) 2015 cvrahimis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExerciseTableViewCell.h"
#import "AppDelegate.h"

@interface ExerciseTableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>{
    NSArray *fetchedObjects;
}

@property (strong, nonatomic) NSArray *fetchedObjects;

@end
