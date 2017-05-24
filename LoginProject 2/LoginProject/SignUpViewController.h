//
//  SignUpViewController.h
//  LoginProject
//
//  Created by Admin on 4/24/17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface SignUpViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *jobTextField;
@property (weak, nonatomic) IBOutlet UITextField *facebookTextField;

@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@property (weak, nonatomic) IBOutlet UITextField *confirmPassTextField;
@property (weak, nonatomic) IBOutlet UISwitch *genderSwitch;

@property (strong, nonatomic) IBOutlet UIView *signUpButton;
- (IBAction)signUpAction:(id)sender;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

- (IBAction)setGendersegment:(id)sender;


@end
