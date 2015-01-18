//
//  WorkoutSumViewController.h
//  Pumped
//
//  Created by Costas Simiharv on 12/9/14.
//  Copyright (c) 2014 cvrahimis. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "WorkoutSumHistory.h"
#import "EditViewController.h"

@interface WorkoutSumViewController : UITableViewController<UINavigationControllerDelegate>
{
    NSMutableArray *summaries;
    //NSMutableDictionary *dates;
    NSManagedObjectContext *managedObjectContext;
    EditViewController *editViewCtrl;
    //WorkoutSumHistory *workout;
}
//@property (nonatomic, strong) NSMutableDictionary *dates;
@property (nonatomic, strong) NSMutableArray *summaries;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) EditViewController *editViewCtrl;
//@property (nonatomic, strong) WorkoutSumHistory *workout;

@end
