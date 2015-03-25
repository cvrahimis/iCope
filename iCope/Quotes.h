//
//  Quotes.h
//  iCope
//
//  Created by Costas Simiharv on 3/25/15.
//  Copyright (c) 2015 cvrahimis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Quotes : NSManagedObject

@property (nonatomic, retain) NSString * author;
@property (nonatomic, retain) NSString * quote;

@end
