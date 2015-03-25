//
//  Activities.h
//  iCope
//
//  Created by Costas Simiharv on 3/25/15.
//  Copyright (c) 2015 cvrahimis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Patient, Therapist;

@interface Activities : NSManagedObject

@property (nonatomic, retain) NSString * activity;
@property (nonatomic, retain) NSNumber * activityId;
@property (nonatomic, retain) NSString * duration;
@property (nonatomic, retain) NSNumber * patientId;
@property (nonatomic, retain) NSNumber * therapistId;
@property (nonatomic, retain) NSString * time;
@property (nonatomic, retain) NSString * mood;
@property (nonatomic, retain) NSNumber * urge;
@property (nonatomic, retain) Therapist *therapist;
@property (nonatomic, retain) Patient *patient;

@end
