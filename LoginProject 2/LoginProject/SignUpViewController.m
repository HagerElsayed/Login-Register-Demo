//
//  SignUpViewController.m
//  LoginProject
//
//  Created by Admin on 4/24/17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "SignUpViewController.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"Sign UP";
    _signUpButton.layer.cornerRadius=10;
    _signUpButton.clipsToBounds=YES;
    _signUpButton.layer.backgroundColor=[UIColor purpleColor].CGColor;
}

-(void)viewDidDisappear:(BOOL)animated{
    if(_emailTextField.text.length>0 && _passwordTextField.text.length>0){
        NSDictionary* userInfo = @{@"email":_emailTextField.text,@"password":_passwordTextField.text};
    
        [[NSUserDefaults standardUserDefaults] setObject: userInfo forKey:@"multipleData"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [_emailTextField resignFirstResponder];
        
        [_passwordTextField resignFirstResponder];
        
    }else{
        
        UIAlertController* alertConttroller=[UIAlertController alertControllerWithTitle:@"Sorry" message:@"Empty Fileds" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* alertAction=[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
        [alertConttroller addAction:alertAction];
        [self presentViewController:alertConttroller animated:YES completion:nil];
        NSLog(@"Empty Text Field");
    }
    
    
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

- (IBAction)signUpAction:(id)sender {

    if(_emailTextField.text.length>0 && _passwordTextField.text.length>0){
        [[NSUserDefaults standardUserDefaults] setObject:_firstNameTextField.text forKey:@"firstName"];
        [[NSUserDefaults standardUserDefaults] setObject:_lastNameTextField.text forKey:@"lastName"];
        [[NSUserDefaults standardUserDefaults] setObject:_facebookTextField.text forKey:@"facebook"];
        [[NSUserDefaults standardUserDefaults] setObject:_jobTextField.text forKey:@"job"];
        [[NSUserDefaults standardUserDefaults] setObject:_emailTextField.text forKey:@"email"];
       
        [[NSUserDefaults standardUserDefaults] setObject:_passwordTextField.text forKey:@"password"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        if([_passwordTextField.text isEqualToString:_confirmPassTextField.text]){
            [[NSUserDefaults standardUserDefaults] setObject:_confirmPassTextField.text forKey:@"confirmPassword"];
            
        }
        else{
            
            UIAlertController* alertConttroller=[UIAlertController alertControllerWithTitle:@"Sorry" message:@"Password not matched" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction* alertAction=[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
            [alertConttroller addAction:alertAction];
            [self presentViewController:alertConttroller animated:YES completion:nil];
        }
        [[NSUserDefaults standardUserDefaults] synchronize];
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        
        UIAlertController* alertConttroller=[UIAlertController alertControllerWithTitle:@"Sorry" message:@"Empty Fileds" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* alertAction=[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
        [alertConttroller addAction:alertAction];
        [self presentViewController:alertConttroller animated:YES completion:nil];
        NSLog(@"Empty Text Field");
    }
        [[NSUserDefaults standardUserDefaults] synchronize];
    
}
- (IBAction)setGendersegment:(id)sender {
    if (_segmentedControl.selectedSegmentIndex == 0) {
         [[NSUserDefaults standardUserDefaults] setObject:@"Female" forKey:@"gender"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
    }
    else{
    [[NSUserDefaults standardUserDefaults] setObject:@"Male" forKey:@"gender"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    
    }
    
    
}
@end
