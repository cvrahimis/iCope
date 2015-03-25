//
//  Therapist.h
//  iCope
//
//  Created by Costas Simiharv on 3/25/15.
//  Copyright (c) 2015 cvrahimis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Activities, ButtonActivations, Patient;

@interface Therapist : NSManagedObject

@property (nonatomic, retain) NSString * therapistFirstName;
@property (nonatomic, retain) NSNumber * therapistId;
@property (nonatomic, retain) NSString * therapistLastName;
@property (nonatomic, retain) Patient *patient;
@property (nonatomic, retain) Activities *activity;
@property (nonatomic, retain) NSSet *buttonActivations;
@end

@interface Therapist (CoreDataGeneratedAccessors)

- (void)addButtonActivationsObject:(ButtonActivations *)value;
- (void)removeButtonActivationsObject:(ButtonActivations *)value;
- (void)addButtonActivations:(NSSet *)values;
- (void)removeButtonActivations:(NSSet *)values;

@end
