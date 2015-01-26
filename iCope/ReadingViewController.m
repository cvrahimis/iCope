//
//  ReadingViewController.m
//  BlueApp
//
//  Created by Costas Simiharv on 1/13/15.
//  Copyright (c) 2015 cvrahimis. All rights reserved.
//

#import "ReadingViewController.h"

@implementation ReadingViewController
@synthesize background;
@synthesize quoteLbl;
@synthesize quotes;
@synthesize nextBtn;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    count = 0;
    
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];;
    NSManagedObjectContext *managedObjectContext = appDelegate.managedObjectContext;
    
    background.backgroundColor = [UIColor redColor];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Quotes" inManagedObjectContext: managedObjectContext];
    [fetchRequest setEntity:entity];
    NSError *error = nil;
    quotes = [managedObjectContext executeFetchRequest:fetchRequest error: &error];
    
    
    
    if (quotes != nil) {
        Quotes *q = [quotes objectAtIndex:count];
        //NSLog(@"%@",[quotes objectAtIndex:count]);
        quoteLbl.text = [q valueForKey:@"quote"];
    
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)nextBtnPress:(id)sender {
    if (count < quotes.count) count++;
    else count = 0;
    Quotes *q = [quotes objectAtIndex:count];
    quoteLbl.text = [q valueForKey:@"quote"];
}
@end
