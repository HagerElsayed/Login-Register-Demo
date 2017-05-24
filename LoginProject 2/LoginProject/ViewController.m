//
//  ViewController.m
//  LoginProject
//
//  Created by Admin on 4/23/17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "ViewController.h"
#import "SignUpViewController.h"
#import "ForgotPassViewController.h"
#import "TableViewController.h"


@interface ViewController (){
    NSString* emailPassed;
    NSString* passwordPassed,*firstName,*lastName,*job,*facebook,*gender;
    BOOL test;
    
}

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
//       if(emailPassed != nil &&  passwordPassed != nil){
//        TableViewController* tableview=[self.storyboard instantiateViewControllerWithIdentifier:@"TableViewController"];
//
//        [self.navigationController pushViewController:tableview animated:YES];
//    }
 
    
    firstName=[[NSUserDefaults standardUserDefaults]
                 stringForKey:@"firstName"];
    lastName=[[NSUserDefaults standardUserDefaults]
                 stringForKey:@"lastName"];
    emailPassed=[[NSUserDefaults standardUserDefaults]
                 stringForKey:@"email"];
    job=[[NSUserDefaults standardUserDefaults]
                 stringForKey:@"job"];
    facebook=[[NSUserDefaults standardUserDefaults]
                 stringForKey:@"facebook"];
    passwordPassed=[[NSUserDefaults standardUserDefaults]
                    stringForKey:@"password"];
  // test = [[NSUserDefaults standardUserDefaults] boolForKey:@"switch"];
    gender=[[NSUserDefaults standardUserDefaults]
            stringForKey:@"gender"];
    NSLog(@"%@",gender);
    
    
    
    
    
    self.title=@"Home";
    _loginButton.layer.cornerRadius=10;
    _loginButton.layer.backgroundColor=[UIColor purpleColor].CGColor;
    _loginButton.clipsToBounds=YES;
    _signUpButton.layer.cornerRadius=10;
    _signUpButton.clipsToBounds=YES;
    _signUpButton.layer.backgroundColor=[UIColor purpleColor].CGColor;
    _forgetPassButton.layer.cornerRadius=10;
    _forgetPassButton.clipsToBounds=YES;
    _forgetPassButton.layer.backgroundColor=[UIColor purpleColor].CGColor;
    
}
//
//- (void)encodeWithCoder:(NSCoder *)encoder {
//    //Encode properties, other class variables, etc
//    [encoder encodeObject:self.emailTextField.text forKey:@"email"];
//    [encoder encodeObject:self.passwordTextField.text forKey:@"password"];
//
//}
//
//- (id)initWithCoder:(NSCoder *)decoder {
//    if((self = [super init])) {
//        //decode properties, other class vars
//        emailPassed= [decoder decodeObjectForKey:@"email"];
//        passwordPassed= [decoder decodeObjectForKey:@"password"];
//
//    }
//    return self;
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)loginAction:(id)sender {
    NSString* currentEmail=_emailTextField.text;
    NSString* currentPassword=_passwordTextField.text;
    if(_emailTextField.text.length>0 && _passwordTextField.text.length>0){
        if(currentEmail==emailPassed && currentPassword==passwordPassed ){
            TableViewController* tableview=[self.storyboard instantiateViewControllerWithIdentifier:@"TableViewController"];
            tableview.personalInfo= [[NSDictionary alloc] initWithObjectsAndKeys:firstName,@"firstName",lastName,@"lastName",emailPassed,@"email",job,@"job",facebook,@"facebook",gender,@"gender", nil];
            [self.navigationController pushViewController:tableview animated:YES];
            
            NSLog(@"Right");
        }
        else{
            UIAlertController* alertConttroller=[UIAlertController alertControllerWithTitle:@"Sorry" message:@"Wrong Email or Password" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction* alertAction=[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
            [alertConttroller addAction:alertAction];
            [self presentViewController:alertConttroller animated:YES completion:nil];
            NSLog(@"Wrong");
            
        }
        
        
    }
    else{
        UIAlertController* alertConttroller=[UIAlertController alertControllerWithTitle:@"Sorry" message:@"Empty Fileds" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* alertAction=[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
        [alertConttroller addAction:alertAction];
        [self presentViewController:alertConttroller animated:YES completion:nil];
        NSLog(@"Empty Text Field");
        
    }
}

- (IBAction)signUpAction:(id)sender {
    SignUpViewController *signUpView=[self.storyboard instantiateViewControllerWithIdentifier:@"SignUpViewController"];
    [self.navigationController pushViewController:signUpView animated:YES];
    
}

- (IBAction)forgetPasswordAction:(id)sender {
    ForgotPassViewController *forgetPassView=[self.storyboard instantiateViewControllerWithIdentifier:@"ForgotPassViewController"];
    [self.navigationController pushViewController:forgetPassView animated:YES];
}
@end
