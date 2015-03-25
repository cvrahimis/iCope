//
//  Exercises.h
//  iCope
//
//  Created by Costas Simiharv on 3/25/15.
//  Copyright (c) 2015 cvrahimis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Exercises : NSManagedObject

@property (nonatomic, retain) NSString * exerciseName;
@property (nonatomic, retain) NSString * mainPicture;
@property (nonatomic, retain) NSString * pictures;

@end
