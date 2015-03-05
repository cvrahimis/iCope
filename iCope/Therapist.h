//
//  Therapist.h
//  iCope
//
//  Created by Costas Simiharv on 3/4/15.
//  Copyright (c) 2015 cvrahimis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Activities, ButtonActivations, Patient;

@interface Therapist : NSManagedObject

@property (nonatomic, retain) NSString * therapistFirstName;
@property (nonatomic, retain) NSNumber * therapistId;
@property (nonatomic, retain) NSString * therapistLastName;
@property (nonatomic, retain) NSSet *therapistBtnAct;
@property (nonatomic, retain) Activities *therapistActivities;
@property (nonatomic, retain) NSSet *patient;
@end

@interface Therapist (CoreDataGeneratedAccessors)

- (void)addTherapistBtnActObject:(ButtonActivations *)value;
- (void)removeTherapistBtnActObject:(ButtonActivations *)value;
- (void)addTherapistBtnAct:(NSSet *)values;
- (void)removeTherapistBtnAct:(NSSet *)values;

- (void)addPatientObject:(Patient *)value;
- (void)removePatientObject:(Patient *)value;
- (void)addPatient:(NSSet *)values;
- (void)removePatient:(NSSet *)values;

@end
