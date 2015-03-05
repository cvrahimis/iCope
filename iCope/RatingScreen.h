//
//  RatingScreen.h
//  iCope
//
//  Created by Costas Simiharv on 3/4/15.
//  Copyright (c) 2015 cvrahimis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface RatingScreen : NSManagedObject

@property (nonatomic, retain) NSNumber * activityId;
@property (nonatomic, retain) NSString * mood;
@property (nonatomic, retain) NSNumber * patientId;
@property (nonatomic, retain) NSNumber * ratingId;
@property (nonatomic, retain) NSNumber * time;
@property (nonatomic, retain) NSNumber * urge;

@end
