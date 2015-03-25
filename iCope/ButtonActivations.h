//
//  ButtonActivations.h
//  iCope
//
//  Created by Costas Simiharv on 3/25/15.
//  Copyright (c) 2015 cvrahimis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Patient, Therapist;

@interface ButtonActivations : NSManagedObject

@property (nonatomic, retain) NSNumber * buttonId;
@property (nonatomic, retain) NSNumber * patientId;
@property (nonatomic, retain) NSNumber * therapistId;
@property (nonatomic, retain) NSNumber * time;
@property (nonatomic, retain) Therapist *therapist;
@property (nonatomic, retain) Patient *patient;

@end
