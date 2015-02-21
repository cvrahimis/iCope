//
//  JournalViewController.m
//  BlueApp
//
//  Created by Costas Simiharv on 1/13/15.
//  Copyright (c) 2015 cvrahimis. All rights reserved.
//

#import "JournalViewController.h"

@interface JournalViewController ()

@end

@implementation JournalViewController
@synthesize background;
@synthesize saveBtn;
@synthesize titleTF;
@synthesize entryTV;

-(id) init{
    if(self = [super init])
    {
        
    }
    return self;
}

- (void)viewDidLoad {
    NSLog(@"%s",__PRETTY_FUNCTION__);
    [super viewDidLoad];
    currentTime = [self Time];
    [self initBackground];
    entryTV.layer.borderWidth = 0.5f;
    entryTV.layer.borderColor = [[UIColor blackColor] CGColor];
    titleTF.placeholder = @"Title";
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyBoard)];
    singleTap.numberOfTapsRequired = 1;
    self.background.userInteractionEnabled = YES;
    [self.background addGestureRecognizer:singleTap];
    
}

- (void)didReceiveMemoryWarning {
    NSLog(@"%s",__PRETTY_FUNCTION__);
    [super didReceiveMemoryWarning];
    
}

- (IBAction)savePress:(id)sender {
    NSLog(@"%s",__PRETTY_FUNCTION__);
    if([entryTV.text isEqualToString:@""] && [titleTF.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"There is no title or entry"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
    else
    {
        AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];;
    
        NSManagedObjectContext *managedObjectContext = appDelegate.managedObjectContext;
    
        NSDateFormatter *dateformate=[[NSDateFormatter alloc]init];
        [dateformate setDateFormat:@"MM/dd/YYYY"];
    
        Journal *journal = [NSEntityDescription insertNewObjectForEntityForName: @"Journal" inManagedObjectContext: managedObjectContext];
        [journal setValue:titleTF.text forKey:@"title"];
        [journal setValue:entryTV.text forKey:@"entry"];
        [journal setValue:[dateformate stringFromDate:[NSDate date]] forKey:@"date"];
        NSError *error = nil;
        if([managedObjectContext save: &error])
        {
            NSLog(@"Successsfully added %@",titleTF.text);
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success"
                                                            message:[@"Saved " stringByAppendingString:titleTF.text]
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        }
        else
        {
            NSLog(@"Could Not add %@",titleTF.text);
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failed"
                                                            message:[@"Could not save " stringByAppendingString:titleTF.text]
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        }
    }

}

-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"%s",__PRETTY_FUNCTION__);
    self.navigationItem.title = @"Journal";
    self.navigationController.navigationBar.translucent = NO;
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
    
    self.navigationItem.rightBarButtonItem = self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]
                                                                                      initWithTitle:@"Open"
                                                                                      style:UIBarButtonItemStyleDone
                                                                                      target:self
                                                                                      action:@selector(open)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]
                                             initWithTitle:@"Done"
                                             style:UIBarButtonItemStyleDone
                                             target:self
                                             action:@selector(done)];
    
    entryTV.text = entry;
    titleTF.text = title;
}

-(void)hideKeyBoard
{
    [self.view endEditing:YES];
}

- (BOOL) textFieldShouldReturn: (UITextField *) txtField {
    [txtField resignFirstResponder];
    return YES;
}

-(BOOL)textViewShouldReturn: (UITextView *) txtView{
    [txtView resignFirstResponder];
    return YES;
}

-(void) done{
    NSLog(@"%s",__PRETTY_FUNCTION__);
    RatingViewController *rvc = [[RatingViewController alloc]init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:rvc];
    
    //now present this navigation controller modally
    [self presentViewController:navigationController
                       animated:YES
                     completion:nil];
}

-(void) open{
    NSLog(@"%s",__PRETTY_FUNCTION__);
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    //OpenEntriesViewController * oevc = [mainStoryboard instantiateViewControllerWithIdentifier:@"openEntriesViewController"];
    //OpenEntriesViewController *oevc = [[OpenEntriesViewController alloc] init];
    //[self presentViewController:oevc animated:YES completion:nil];
    //OpenEntriesViewController *oevc = [[OpenEntriesViewController alloc] init];
    //OpenEntriesViewController * oevc = [mainStoryboard instantiateViewControllerWithIdentifier:@"openEntriesViewController"];
    //UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:oevc];
    
    //now present this navigation controller modally
    //[self presentViewController:navigationController animated:YES completion:nil];
    
    OpenEntriesViewController *oevc = [[OpenEntriesViewController alloc] init];
    [oevc setDelegate:self];
    [self.navigationController pushViewController:oevc animated:YES];
}

- (void)closeOpenEntries:(id)sender{
    NSLog(@"%s",__PRETTY_FUNCTION__);
    title = ((OpenEntriesViewController*)sender).title;
    entry = ((OpenEntriesViewController*)sender).entry;
    [self.navigationController popViewControllerAnimated:YES];
    //[self dismissViewControllerAnimated:YES completion:nil];
}

-(NSInteger *) Time {
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH"];
    NSString *timeOfDayInHoursString = [dateFormatter stringFromDate:date];
    NSInteger *timeOfDayInHours = [timeOfDayInHoursString integerValue];
    return timeOfDayInHours;
}

-(void) initBackground {
    if (currentTime < 12) background.image = [UIImage imageNamed:@"Morning"];
    else if (currentTime > 12 && currentTime < 18) background.image = [UIImage imageNamed:@"Afternoon"];
    else background.image = [UIImage imageNamed:@"Evening"];
}

@end
