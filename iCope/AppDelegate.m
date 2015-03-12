//
//  AppDelegate.m
//  iCope
//
//  Created by Costas Simiharv on 1/17/15.
//  Copyright (c) 2015 cvrahimis. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize exerciseNames;
@synthesize exerciseImgs;
@synthesize mainImg;
@synthesize exercise;
@synthesize quotes;
@synthesize authors;
@synthesize bec;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"Exercises" inManagedObjectContext:[self managedObjectContext]];
    [fetchRequest setEntity:entity];
    NSError *error = nil;
    NSArray *fetchedObjects = [_managedObjectContext executeFetchRequest:fetchRequest error: &error];
    
    if (fetchedObjects.count == 0) {
        exerciseNames = @[@"Back lifts", @"Crunches", @"Leg lifts", @"Planks"];
        exerciseImgs= @[@"backlifts1|backlifts2", @"crunches1|crunches2|crunches3", @"leglifts1|leglifts2|leglifts3", @"plank|sideplank"];
        mainImg = @[@"backlifts1", @"crunches1", @"leglifts1", @"plank"];
        
        [self setUpExerciseTable];
    }
    
    fetchRequest = [[NSFetchRequest alloc] init];
    entity = [NSEntityDescription entityForName:@"Quotes" inManagedObjectContext:[self managedObjectContext]];
    [fetchRequest setEntity:entity];
    error = nil;
    fetchedObjects = [_managedObjectContext executeFetchRequest:fetchRequest error: &error];
    
    if (fetchedObjects.count == 0) {
        quotes = @[@"\"I do not agree with what you have to say, but I'll defend to the death your right to say it.\"",@"\"It is dangerous to be right in matters on which the established authorities are wrong.\"", @"\"Life is thickly sown with thorns, and I know no other remedy than to pass quickly through them. The longer we dwell on our misfortunes, the greater is their power to harm us.\""];
        authors = @[@"-Voltaire",@"-Voltaire",@"-Voltaire"];
        [self setUpQuotesTable];
    }
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    bec = [[BackEndComunicator alloc] initWithManagedObjectContext:_managedObjectContext];
    //if ([bec isPatientAndTherapistOnDevice])
        self.viewController = [[RatingViewController alloc] init];
    //else
        //self.viewController = [[LoginViewController alloc] init];
    
    self.navCtrl = [[UINavigationController alloc] initWithRootViewController: self.viewController];
    //[self.navCtrl setNavigationBarHidden:NO animated:YES];
    self.navCtrl.delegate = self.viewController;
    [self.window 	setRootViewController: self.navCtrl];
    self.window.userInteractionEnabled = YES;
    [self.window makeKeyAndVisible];
    
    [[UIApplication sharedApplication] setStatusBarHidden: YES];
    
    return YES;
}

-(void)setUpQuotesTable{
    for (int i = 0; i < [quotes count]; i++)
    {
        quote = [NSEntityDescription insertNewObjectForEntityForName: @"Quotes" inManagedObjectContext: _managedObjectContext];
        [quote setValue:quotes[i] forKey:@"quote"];
        [quote setValue:authors[i] forKey:@"author"];
        
        NSError *error = nil;
        if([_managedObjectContext save: &error])
        {
            NSLog(@"%@", [@"Successsfully added " stringByAppendingString:quotes[i]]);
        }
    }
}


-(void)setUpExerciseTable{
    for (int i = 0; i < [exerciseNames count]; i++)
    {
        exercise = [NSEntityDescription insertNewObjectForEntityForName: @"Exercises" inManagedObjectContext: _managedObjectContext];
        [exercise setValue:exerciseNames[i] forKey:@"exerciseName"];
        [exercise setValue:exerciseImgs[i] forKey:@"pictures"];
        [exercise setValue:mainImg[i] forKey:@"mainPicture"];
        
        NSError *error = nil;
        if([_managedObjectContext save: &error])
        {
            NSLog(@"%@", [@"Successsfully added " stringByAppendingString:exerciseNames[i]]);
        }
    }
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "com.cvrahimis.iCope" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"iCope" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"iCope.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
