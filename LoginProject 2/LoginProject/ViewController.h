//
//  ViewController.h
//  LoginProject
//
//  Created by Admin on 4/23/17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *signUpButton;
@property (weak, nonatomic) IBOutlet UIButton *forgetPassButton;


- (IBAction)loginAction:(id)sender;

- (IBAction)signUpAction:(id)sender;
- (IBAction)forgetPasswordAction:(id)sender;

@end

