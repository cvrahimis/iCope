//
//  Patient.h
//  iCope
//
//  Created by Costas Simiharv on 3/25/15.
//  Copyright (c) 2015 cvrahimis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Activities, ButtonActivations, Therapist;

@interface Patient : NSManagedObject

@property (nonatomic, retain) NSString * patientFirstName;
@property (nonatomic, retain) NSNumber * patientId;
@property (nonatomic, retain) NSString * patientLastName;
@property (nonatomic, retain) NSString * patientLogin;
@property (nonatomic, retain) NSString * patientPassword;
@property (nonatomic, retain) NSNumber * therapistId;
@property (nonatomic, retain) Activities *activity;
@property (nonatomic, retain) ButtonActivations *buttonActivations;
@property (nonatomic, retain) Therapist *therapist;

@end
