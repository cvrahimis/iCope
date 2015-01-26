//
//  WorkoutSumViewController.m
//  Pumped
//
//  Created by Costas Simiharv on 12/9/14.
//  Copyright (c) 2014 cvrahimis. All rights reserved.
//

#import "WorkoutSumViewController.h"


#define frameWidth self.view.frame.size.width
#define frameHeight self.view.frame.size.height

@implementation WorkoutSumViewController

@synthesize editViewCtrl;
@synthesize summaries;
@synthesize managedObjectContext;
//@synthesize workout;

- (void) addWorkoutSum
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    //WorkoutSumHistory *wsh = [NSEntityDescription insertNewObjectForEntityForName: @"WorkoutSumHistory" inManagedObjectContext: managedObjectContext];

    //NSError *error = nil;
    //if([managedObjectContext save: &error])
    //{
        //[summaries insertObject: wsh atIndex: 0];
        //editViewCtrl.workoutHist = wsh;
        //editViewCtrl.workoutHist = [summaries objectAtIndex: 0];
    //editViewCtrl.dates = [self dates];
        //[self.navigationController pushViewController: editViewCtrl animated:YES];
    //}
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Workout Log";
    
   self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle: @"+"  style:UIBarButtonItemStylePlain target: self action: @selector(addWorkoutSum)];
    
   /* NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName: @"WorkoutSumHistory" inManagedObjectContext: managedObjectContext];
    request.entity = entity;
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey: @"exerciseName" ascending: YES];
    NSArray *sortDescriptors = [NSArray arrayWithObjects: sortDescriptor, nil];
    request.sortDescriptors = sortDescriptors;
    NSError *error = nil;
    summaries = [[managedObjectContext executeFetchRequest: request error: &error] mutableCopy];*/
    
    editViewCtrl = [[EditViewController alloc] init];
}

- (void) viewWillAppear: (BOOL) animated
{
    [super viewWillAppear: animated];
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
    self.navigationItem.title = @"Workout Log";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle: @"Add"  style:UIBarButtonItemStylePlain target: self action: @selector(addWorkoutSum)];

    /*if(editViewCtrl.workoutHist)
    {
        NSIndexPath *path = [NSIndexPath indexPathForRow: [summaries indexOfObject: editViewCtrl.workoutHist] inSection: 0];
        NSArray *paths = [NSArray arrayWithObjects: path, nil];
        [self.tableView reloadRowsAtIndexPaths: paths withRowAnimation: NO];
        editViewCtrl.workoutHist = nil;
    }*/
}



#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return summaries.count;
}


- (UITableViewCell *)tableView: (UITableView *) tableView cellForRowAtIndexPath: (NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier: CellIdentifier];
    
    /*WorkoutSumHistory *wsh = [summaries objectAtIndex: indexPath.row];
    if (wsh.exerciseName == nil)
        cell.textLabel.text = @"\t New Workout Log";
    else
        cell.textLabel.text = [[[NSString stringWithFormat:@"\t %@", wsh.date] stringByAppendingString:@"   "] stringByAppendingString:[NSString stringWithFormat:@"%@", wsh.exerciseName]];
*/
    
    cell.textLabel.font = [UIFont fontWithName: @"Helvetica-Bold" size: 14];
    cell.textLabel.textColor = [UIColor blueColor];
    cell.textLabel.highlightedTextColor = [UIColor yellowColor];
    cell.imageView.image = [UIImage imageNamed: @"Icon-40.png"];
    
    return cell;
}




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //editViewCtrl.workoutHist = [summaries objectAtIndex: indexPath.row];
    //[self.navigationController pushViewController: editViewCtrl animated:YES];
}





- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}




- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        /*[managedObjectContext deleteObject: [summaries objectAtIndex: indexPath.row]];
        NSError *error = nil;
        [managedObjectContext save: &error];
        [summaries removeObjectAtIndex: indexPath.row];
        [tableView deleteRowsAtIndexPaths: [NSArray arrayWithObject: indexPath] withRowAnimation: YES];
         */
    }
}
@end


/* Attempt to make dynamic sections
 
 
 #import "WorkoutSumViewController.h"
 
 
 #define frameWidth self.view.frame.size.width
 #define frameHeight self.view.frame.size.height
 
 @implementation WorkoutSumViewController
 
 @synthesize editViewCtrl;
 @synthesize summaries;
 @synthesize managedObjectContext;
 //@synthesize dates;
 
 - (void) addWorkoutSum
 {
 NSLog(@"%s", __PRETTY_FUNCTION__);
 WorkoutSumHistory *wsh = [NSEntityDescription insertNewObjectForEntityForName: @"WorkoutSumHistory" inManagedObjectContext: managedObjectContext];
 
 //NSError *error = nil;
 //if([managedObjectContext save: &error])
 //{
 [summaries insertObject: wsh atIndex: 0];
 //editViewCtrl.workoutHist = wsh;
 editViewCtrl.workoutHist = [summaries objectAtIndex: 0];
 //editViewCtrl.dates = [self dates];
 [self.navigationController pushViewController: editViewCtrl animated:YES];
 //}
 }
 
 -(void) viewDidLoad{
 
 self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle: @"+"  style:UIBarButtonItemStylePlain target: self action: @selector(addWorkoutSum)];
 
 NSFetchRequest *request = [[NSFetchRequest alloc] init];
 NSEntityDescription *entity = [NSEntityDescription entityForName: @"WorkoutSumHistory" inManagedObjectContext: managedObjectContext];
 request.entity = entity;
 
 NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey: @"date" ascending: YES];
 NSArray *sortDescriptors = [NSArray arrayWithObjects: sortDescriptor, nil];
 request.sortDescriptors = sortDescriptors;
 NSError *error = nil;
 summaries = [[managedObjectContext executeFetchRequest: request error: &error] mutableCopy];

//=============================================================================
 dates = [[NSMutableDictionary alloc] init];
 
 for(NSManagedObject *info in summaries)
 {
 if(![dates objectForKey:[info valueForKey:@"date"]])
 {
 NSMutableArray *date = [[NSMutableArray alloc] init];
 [date addObject:info];
 [dates setObject:date forKey:[info valueForKey:@"date"]];
 date = nil;
 }
 else
 {
 NSMutableArray *date = [dates objectForKey:[info valueForKey:@"date"]];
 [date addObject:info];
 [dates setObject:date forKey:[info valueForKey:@"date"]];
 date = nil;
 }
 }
//=============================================================================

editViewCtrl = [[EditViewController alloc] init];
}

- (void) viewWillAppear: (BOOL) animated
{
    [super viewWillAppear: animated];
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
    self.navigationItem.title = @"Workout Log";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle: @"Add"  style:UIBarButtonItemStylePlain target: self action: @selector(addWorkoutSum)];
    
    if(editViewCtrl.workoutHist)
    {
        //=============================================================================
        if(![dates objectForKey:[editViewCtrl.workoutHist valueForKey:@"date"]])
         {
         NSMutableArray *date = [[NSMutableArray alloc] init];
         [date addObject:editViewCtrl.workoutHist];
         [dates setObject:date forKey:[editViewCtrl.workoutHist valueForKey:@"date"]];
         date = nil;
         }
         else
         {
         NSMutableArray *date = [dates objectForKey:[editViewCtrl.workoutHist valueForKey:@"date"]];
         [date addObject:editViewCtrl.workoutHist];
         [dates setObject:date forKey:[editViewCtrl.workoutHist valueForKey:@"date"]];
         date = nil;
         }
         
         
         int count = 0;
         NSIndexPath *path;
         for(NSString *date in dates)
         {
         if([[dates objectForKey:date] containsObject:editViewCtrl.workoutHist])
         {
         path = [NSIndexPath indexPathForRow: [[dates objectForKey:date] indexOfObject:editViewCtrl.workoutHist] inSection: count];
         }
         }
         //=============================================================================
        NSIndexPath *path = [NSIndexPath indexPathForRow: [summaries indexOfObject: editViewCtrl.workoutHist] inSection: 0];
        NSArray *paths = [NSArray arrayWithObjects: path, nil];
        [self.tableView reloadRowsAtIndexPaths: paths withRowAnimation: NO];
        editViewCtrl.workoutHist = nil;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //return [dates count];
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//=============================================================================
    int count = 0;
     int tempCount = 0;
     for(NSString *date in dates)
     {
     if(section == count)
     {
     NSMutableArray *temp = [dates objectForKey:date];
     tempCount = (int)[temp count];
     temp = nil;
     //return tempCount;
     }
     count++;
     }
     return tempCount;
//=============================================================================
    return summaries.count;
}

- (UITableViewCell *)tableView: (UITableView *) tableView cellForRowAtIndexPath: (NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier: CellIdentifier];
        
        WorkoutSumHistory *wsh = [summaries objectAtIndex: indexPath.row];
        //=============================================================================
    int count = 0;
     WorkoutSumHistory *wsh;
     
     for(NSString *date in dates)
     {
     if([indexPath section] == count)
     {
     wsh = [[dates objectForKey:date] objectAtIndex: indexPath.row];
     }
     count++;
     }
         //=============================================================================
        
        
        if (wsh.exerciseName == nil)
            cell.textLabel.text = @"\t New Exercise Summary";
            else
                cell.textLabel.text = [[[NSString stringWithFormat:@"\t %@", wsh.date] stringByAppendingString:@"   "] stringByAppendingString:[NSString stringWithFormat:@"%@", wsh.exerciseName]];
                
                
                cell.textLabel.font = [UIFont fontWithName: @"Helvetica-Bold" size: 14];
                cell.textLabel.textColor = [UIColor blueColor];
                cell.textLabel.highlightedTextColor = [UIColor yellowColor];
                cell.imageView.image = [UIImage imageNamed: @"Icon-40.png"];
                
                return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //=============================================================================
    int count = 0;
     for(NSString *date in dates)
     {
     if([indexPath section] == count)
     {
     editViewCtrl.workoutHist = [[dates objectForKey:date] objectAtIndex: indexPath.row];
     }
     count++;
     }
    //=============================================================================
    editViewCtrl.workoutHist = [summaries objectAtIndex: indexPath.row];
    //editViewCtrl.dates = [self dates];
    [self.navigationController pushViewController: editViewCtrl animated:YES];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void) tableView: (UITableView *) tableView commitEditingStyle: (UITableViewCellEditingStyle) editingStyle forRowAtIndexPath: (NSIndexPath *) indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        //=============================================================================
        int count = 0;
         
         for(NSString *date in dates)
         {
         if(count == [indexPath section])
         {
         NSMutableArray *temp = [dates objectForKey:date];
         [managedObjectContext deleteObject: [temp objectAtIndex: indexPath.row]];
         NSError *error = nil;
         [managedObjectContext save: &error];
         [temp removeObjectAtIndex: indexPath.row];
         [dates setObject:temp forKey:date];
         
         }
         count++;
         }
         //=============================================================================
        [managedObjectContext deleteObject: [summaries objectAtIndex: indexPath.row]];
        NSError *error = nil;
        [managedObjectContext save: &error];
        [summaries removeObjectAtIndex: indexPath.row];
        [tableView deleteRowsAtIndexPaths: [NSArray arrayWithObject: indexPath] withRowAnimation: YES];
        
        
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}



- (UIView *) tableView: (UITableView *) tableView viewForHeaderInSection: (NSInteger) section {
 UILabel *temp = [[UILabel alloc] init];
 temp.font = [UIFont fontWithName: @"Helvetica-Bold" size: 16];
 temp.textColor = [UIColor colorWithRed:.05 green:.1 blue: 0.5 alpha: 1.0];
 int count = 0;
 for(NSString *date in dates)
 {
 if(count == section)
 {
 temp.text = date;
 }
 count++;
 }
 
 return temp;
 }

@end

 */

