//
//  ForgetPasswordViewController.m
//  LoginProject
//
//  Created by Admin on 4/24/17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "ChangePasswordViewController.h"

@interface ChangePasswordViewController ()

@end

@implementation ChangePasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"Reset Password";
    _resetPass.layer.cornerRadius=10;
    _resetPass.clipsToBounds=YES;
    _resetPass.layer.backgroundColor=[UIColor purpleColor].CGColor;
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

- (IBAction)chagePasswordButton:(id)sender {
    if(_currentPassword.text.length>0 && _NewPasswordTextField.text.length>0 && _confirmNewPasswordTextField.text.length>0){
        if([_NewPasswordTextField.text isEqualToString:_confirmNewPasswordTextField.text]){
            
            
           // NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
            
            // getting an NSString
            
            //[[NSUserDefaults standardUserDefaults] removeObjectForKey:@"password"];
            
//            [prefs setObject:_confirmNewPasswordTextField.text forKey:@"password"];
 [[NSUserDefaults standardUserDefaults] setObject:_NewPasswordTextField.text forKey:@"password"];
//            NSString  *passwordStr = [prefs stringForKey:@"Password"];
            
            [[NSUserDefaults standardUserDefaults] synchronize];
          [self.navigationController popViewControllerAnimated:YES];
            

        
        }
        else{ UIAlertController* alertConttroller=[UIAlertController alertControllerWithTitle:@"Sorry" message:@"Password not matched" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction* alertAction=[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
            [alertConttroller addAction:alertAction];
            [self presentViewController:alertConttroller animated:YES completion:nil];}
    
    }
    
}
@end
