//
//  AppDelegate.h
//  iCope
//
//  Created by Costas Simiharv on 1/17/15.
//  Copyright (c) 2015 cvrahimis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "Exercises.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    Exercises *exercise;
    NSArray *exerciseNames;
    NSArray *exerciseImgs;
    NSArray *mainImg;
}

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;


@property (strong, nonatomic) NSArray *exerciseNames;
@property (strong, nonatomic) NSArray *exerciseImgs;
@property (strong, nonatomic) NSArray *mainImg;
@property (strong, nonatomic) Exercises *exercise;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

