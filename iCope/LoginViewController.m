//
//  LoginViewController.m
//  iCope
//
//  Created by Costas Simiharv on 3/4/15.
//  Copyright (c) 2015 cvrahimis. All rights reserved.
//

#import "LoginViewController.h"
#define frameWidth self.view.frame.size.width
#define frameHeight self.view.frame.size.height

@implementation LoginViewController
@synthesize background;
@synthesize usernameTF;
@synthesize passwordTF;
@synthesize loginBtn;
@synthesize cancelBtn;
@synthesize activeField;
@synthesize scrollView;
@synthesize connectionLbl;
@synthesize internetReach;
@synthesize appName;

-(id) init{
    if(self = [super init])
    {
        background = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frameWidth, frameHeight)];
        background.userInteractionEnabled = YES;
        self.view.userInteractionEnabled = YES;
        currentTime = [self Time];
        [self initBackground];
        [self.view addSubview:background];
        
        connectionLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frameWidth * .7, frameHeight * .1)];
        connectionLbl.center = CGPointMake(frameWidth / 2, self.navigationController.navigationBar.frame.size.height + ((frameHeight * .1) / 2));
        connectionLbl.backgroundColor = [UIColor redColor];
        connectionLbl.textColor = [UIColor whiteColor];
        connectionLbl.text = @"No Internet Connection";
        connectionLbl.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:connectionLbl];
        
        scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, frameWidth, frameHeight)];
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyBoard)];
        singleTap.numberOfTapsRequired = 1;
        self.scrollView.userInteractionEnabled = YES;
        [self.scrollView addGestureRecognizer:singleTap];
        [self.view addSubview:scrollView];
        
        appName = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frameWidth, frameHeight *.1)];
        appName.center = CGPointMake(frameWidth / 2, frameHeight * .15);
        appName.text = @"App Name";
        [appName setFont:[UIFont systemFontOfSize:36]];
        appName.textColor = [UIColor whiteColor];
        appName.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:appName];
        
        usernameTF = [[UITextField alloc] initWithFrame: CGRectMake(0, 0, frameWidth*.65, frameHeight * .1)];
        usernameTF.center = CGPointMake(frameWidth * .5, frameHeight * .3);
        usernameTF.borderStyle = UITextBorderStyleRoundedRect;
        usernameTF.placeholder = @"Username";
        usernameTF.delegate = self;
        [scrollView addSubview:usernameTF];
        
        passwordTF = [[UITextField alloc] initWithFrame: CGRectMake(0, 0, frameWidth*.65, frameHeight * .1)];
        passwordTF.center = CGPointMake(frameWidth * .5, frameHeight * .45);
        passwordTF.secureTextEntry = YES;
        passwordTF.borderStyle = UITextBorderStyleRoundedRect;
        passwordTF.placeholder = @"Password";
        passwordTF.delegate = self;
        [scrollView addSubview:passwordTF];
        
        loginBtn = [UIButton buttonWithType: UIButtonTypeRoundedRect];
        loginBtn.frame = CGRectMake(0, 0, frameWidth*.65, frameHeight * .1);
        loginBtn.center = CGPointMake(frameWidth * .5, frameHeight * .6);
        loginBtn.opaque = YES;
        loginBtn.layer.cornerRadius = 12;
        loginBtn.clipsToBounds = YES;
        loginBtn.backgroundColor = [UIColor colorWithRed: .0 green: .669 blue: .0 alpha: 1.0];
        loginBtn.tintColor = [UIColor whiteColor];
        [loginBtn setTitleColor: [UIColor whiteColor] forState: UIControlStateNormal];
        [loginBtn.titleLabel setFont:[UIFont systemFontOfSize: 22]];
        [loginBtn setTitle:@"Login" forState:UIControlStateNormal];
        [loginBtn addTarget:self action:@selector(userLogin) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:loginBtn];
        
        cancelBtn = [UIButton buttonWithType: UIButtonTypeRoundedRect];
        cancelBtn.frame = CGRectMake(0, 0, frameWidth*.65, frameHeight * .1);
        cancelBtn.center = CGPointMake(frameWidth * .5, frameHeight * .75);
        cancelBtn.opaque = YES;
        cancelBtn.layer.cornerRadius = 12;
        cancelBtn.clipsToBounds = YES;
        cancelBtn.backgroundColor = [UIColor colorWithRed: .0 green: .669 blue: .0 alpha: 1.0];
        cancelBtn.tintColor = [UIColor whiteColor];
        [cancelBtn setTitleColor: [UIColor whiteColor] forState: UIControlStateNormal];
        [cancelBtn.titleLabel setFont:[UIFont systemFontOfSize: 22]];
        [cancelBtn setTitle:@"Cancel" forState:UIControlStateNormal];
        //[loginBtn addTarget:self action:@selector(userDone) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:cancelBtn];
        
        [self testInternetConnection];
        [self connectionLable];
    }
    return self;
}

 // Checks if we have an internet connection or not
 - (void)testInternetConnection
 {
     internetReach = [Reachability reachabilityWithHostname:@"www.google.com"];
 
     // Internet is reachable
     internetReach.reachableBlock = ^(Reachability*reach)
     {
         // Update the UI on the main thread
         dispatch_async(dispatch_get_main_queue(), ^{
             NSLog(@"Yayyy, we have the interwebs!");
         });
     };
 
     // Internet is not reachable
     internetReach.unreachableBlock = ^(Reachability*reach)
     {
         // Update the UI on the main thread
         dispatch_async(dispatch_get_main_queue(), ^{
             NSLog(@"Someone broke the internet :(");
         });
     };
 
     [internetReach startNotifier];
 }

-(void)userLogin{
    if(![usernameTF.text isEqualToString:@""] && ![passwordTF.text isEqualToString:@""])
    {
        
        AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
        BackEndComunicator *bec = [[BackEndComunicator alloc] initWithManagedObjectContext:appDelegate.managedObjectContext];
        if (![bec isPatientAndTherapistOnDevice]) {
            
            UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0,0,50,50)];
            spinner.center = CGPointMake(frameWidth / 2, frameHeight / 2);
            spinner.color = [UIColor blueColor];
            
            [scrollView addSubview:spinner];
            __block BOOL loginSuccess = NO;
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                [spinner startAnimating];
            });
            loginSuccess = [bec loginWithUserName:usernameTF.text andPassword:passwordTF.text];
            [spinner removeFromSuperview];
            
            if (loginSuccess) {
                
                RatingViewController *rvc = [[RatingViewController alloc] init];
                UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:rvc];
                [self.navigationController popToRootViewControllerAnimated:YES];
                //now present this navigation controller modally
                [self presentViewController:navigationController
                                   animated:YES
                                 completion:nil];

            }
            else
            {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid Login" message:@"username or password is incorrect"  delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
                [alert show];
            }
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Patient is alread on Device"  delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Close", nil];
            [alert show];
        }
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"%s",__PRETTY_FUNCTION__);
    [super viewWillAppear:animated];
    
    self.navigationItem.title = @"Login";
    self.navigationController.navigationBar.translucent = NO;
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
    
    
    
}

-(void) connectionLable{
    if([internetReach isReachable])
        [connectionLbl setHidden:YES];
    else
        [connectionLbl setHidden:NO];
}

-(void)hideKeyBoard
{
    [self.view endEditing:YES];
    [scrollView setContentOffset:CGPointMake(0,0) animated:YES];
}

- (BOOL) textFieldShouldReturn: (UITextField *) txtField {
    
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [self connectionLable];
    
    if(txtField == self.usernameTF)
    {
        [self.passwordTF becomeFirstResponder];
        self.passwordTF.delegate = self;
    }
    if(txtField == self.passwordTF)
    {
        [scrollView setContentOffset:CGPointMake(0,0) animated:YES];
        [passwordTF resignFirstResponder];
        return YES;
    }
    
    return NO;
    
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self connectionLable];
    activeField = textField;
    [scrollView setContentOffset:CGPointMake(0, [scrollView convertPoint:CGPointZero fromView:textField].y - 80)];
}


-(int) Time {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH"];
    NSString *timeOfDayInHoursString = [dateFormatter stringFromDate:date];
    int timeOfDayInHours = [timeOfDayInHoursString intValue];
    return timeOfDayInHours;
}

-(void) initBackground {
    if (currentTime < 12) background.image = [UIImage imageNamed:@"Morning"];
    else if (currentTime > 12 && currentTime < 18) background.image = [UIImage imageNamed:@"Afternoon"];
    else background.image = [UIImage imageNamed:@"Evening"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testInternetConnection];
    [self connectionLable];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
