//
//  ButtonActivations.h
//  iCope
//
//  Created by Costas Simiharv on 3/4/15.
//  Copyright (c) 2015 cvrahimis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ButtonActivations : NSManagedObject

@property (nonatomic, retain) NSNumber * buttonId;
@property (nonatomic, retain) NSNumber * patientId;
@property (nonatomic, retain) NSNumber * therapistId;
@property (nonatomic, retain) NSNumber * time;
@property (nonatomic, retain) NSManagedObject *buttonActivations;
@property (nonatomic, retain) NSManagedObject *buttonActivationsPatient;

@end
