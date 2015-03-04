//
//  LoginViewController.h
//  iCope
//
//  Created by Costas Simiharv on 3/4/15.
//  Copyright (c) 2015 cvrahimis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController<UITextFieldDelegate>{
    UIImageView *background;
    int currentTime;
    UITextField *usernameTF;
    UITextField *passwordTF;
    UIButton *loginBtn;
    UIButton *cancelBtn;
    UIScrollView *scrollView;
    UITextField *activeField;
}
@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UITextField *activeField;
@property (strong, nonatomic) UIImageView *background;
@property (strong, nonatomic) UITextField *usernameTF;
@property (strong, nonatomic) UITextField *passwordTF;
@property (strong, nonatomic) UIButton *loginBtn;
@property (strong, nonatomic) UIButton *cancelBtn;


@end
