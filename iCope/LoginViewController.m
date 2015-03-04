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

-(id) init{
    if(self = [super init])
    {
        background = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frameWidth, frameHeight)];
        background.userInteractionEnabled = YES;
        self.view.userInteractionEnabled = YES;
        //UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyBoard)];
        //singleTap.numberOfTapsRequired = 1;
        //self.background.userInteractionEnabled = YES;
        //[self.background addGestureRecognizer:singleTap];
        currentTime = [self Time];
        [self initBackground];
        [self.view addSubview:background];
        
        scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, frameWidth, frameHeight)];
        [self.view addSubview:scrollView];
        
        usernameTF = [[UITextField alloc] initWithFrame: CGRectMake(0, 0, frameWidth*.65, frameHeight * .1)];
        usernameTF.center = CGPointMake(frameWidth * .5, frameHeight * .3);
        usernameTF.borderStyle = UITextBorderStyleRoundedRect;
        usernameTF.placeholder = @"Username";
        usernameTF.delegate = self;
        [scrollView addSubview:usernameTF];
        
        
        
        
        passwordTF = [[UITextField alloc] initWithFrame: CGRectMake(0, 0, frameWidth*.65, frameHeight * .1)];
        passwordTF.center = CGPointMake(frameWidth * .5, frameHeight * .5);
        passwordTF.borderStyle = UITextBorderStyleRoundedRect;
        passwordTF.placeholder = @"Password";
        passwordTF.delegate = self;
        [scrollView addSubview:passwordTF];
        
        loginBtn = [UIButton buttonWithType: UIButtonTypeRoundedRect];
        loginBtn.frame = CGRectMake(0, 0, frameWidth*.65, 40);
        loginBtn.center = CGPointMake(frameWidth * .5, frameHeight * .7);
        loginBtn.opaque = YES;
        loginBtn.layer.cornerRadius = 12;
        loginBtn.clipsToBounds = YES;
        loginBtn.backgroundColor = [UIColor colorWithRed: .0 green: .669 blue: .0 alpha: 1.0];
        loginBtn.tintColor = [UIColor whiteColor];
        [loginBtn setTitleColor: [UIColor whiteColor] forState: UIControlStateNormal];
        [loginBtn.titleLabel setFont:[UIFont systemFontOfSize: 22]];
        [loginBtn setTitle:@"Login" forState:UIControlStateNormal];
        //[loginBtn addTarget:self action:@selector(userDone) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:loginBtn];
        
        cancelBtn = [UIButton buttonWithType: UIButtonTypeRoundedRect];
        cancelBtn.frame = CGRectMake(0, 0, frameWidth*.65, 40);
        cancelBtn.center = CGPointMake(frameWidth * .5, frameHeight * .8);
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
        
        
    }
    return self;
}
/*
-(void)hideKeyBoard
{
    [self.view endEditing:YES];
}
*/
- (BOOL) textFieldShouldReturn: (UITextField *) txtField {
    
    NSLog(@"%s", __PRETTY_FUNCTION__);
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
    activeField = textField;
    scrollView.contentOffset = CGPointMake(0, [scrollView convertPoint:CGPointZero fromView:textField].y - 80);
}


-(int) Time {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH"];
    NSString *timeOfDayInHoursString = [dateFormatter stringFromDate:date];
    int timeOfDayInHours = [timeOfDayInHoursString integerValue];
    return timeOfDayInHours;
}

-(void) initBackground {
    if (currentTime < 12) background.image = [UIImage imageNamed:@"Morning"];
    else if (currentTime > 12 && currentTime < 18) background.image = [UIImage imageNamed:@"Afternoon"];
    else background.image = [UIImage imageNamed:@"Evening"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
