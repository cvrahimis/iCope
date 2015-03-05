//
//  Activities.h
//  iCope
//
//  Created by Costas Simiharv on 3/4/15.
//  Copyright (c) 2015 cvrahimis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Activities : NSManagedObject

@property (nonatomic, retain) NSString * activity;
@property (nonatomic, retain) NSNumber * activityId;
@property (nonatomic, retain) NSNumber * duration;
@property (nonatomic, retain) NSNumber * patientId;
@property (nonatomic, retain) NSNumber * therapistId;
@property (nonatomic, retain) NSNumber * time;
@property (nonatomic, retain) NSManagedObject *activities;
@property (nonatomic, retain) NSManagedObject *activityPatient;

@end
