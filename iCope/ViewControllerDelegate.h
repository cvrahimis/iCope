//
//  ViewControllerDelegate.h
//  MoviePlay
//
//  Created by Lubomir Ivanov on 10/5/13.
//  Copyright (c) 2013 L.Ivanov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ViewControllerDelegate <NSObject>

@optional
- (void) cleanup;

@end
