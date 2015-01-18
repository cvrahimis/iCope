//
//  EditViewController.h
//  VehicleDB
//
//  Created by Costas on 11/5/14.
//  Copyright (c) 2014 Costas. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "WorkoutSumHistory.h"


@interface EditViewController : UIViewController <UITextFieldDelegate, UINavigationControllerDelegate> {
    UITextField *eName;
    UITextField *reps;
    UITextField *weight;
    UITextField *sets;
    UIButton *done;
//    WorkoutSumHistory *workoutHist;
    UIImageView *background;
//    NSManagedObjectContext *context;
    NSMutableDictionary *dates;
}

@property(nonatomic, strong) UIButton *done;
@property(nonatomic, strong) UITextField *eName;
@property(nonatomic, strong) UITextField *sets;
@property(nonatomic, strong) UITextField *reps;
@property(nonatomic, strong) UITextField *weight;
//@property(nonatomic, strong) WorkoutSumHistory *workoutHist;
@property(nonatomic, strong) UIImageView *background;
//@property(nonatomic, strong) NSManagedObjectContext *context;
@property(nonatomic, strong) NSMutableDictionary *dates;

@end
