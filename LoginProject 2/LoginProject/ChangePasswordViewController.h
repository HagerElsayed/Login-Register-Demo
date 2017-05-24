//
//  ForgetPasswordViewController.h
//  LoginProject
//
//  Created by Admin on 4/24/17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChangePasswordViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *resetPass;
@property (weak, nonatomic) IBOutlet UITextField *currentPassword;

@property (weak, nonatomic) IBOutlet UITextField *NewPasswordTextField;

@property (weak, nonatomic) IBOutlet UITextField *confirmNewPasswordTextField;
- (IBAction)chagePasswordButton:(id)sender;

@end
