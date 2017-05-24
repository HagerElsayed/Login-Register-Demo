//
//  TableViewController.h
//  LoginProject
//
//  Created by Admin on 4/24/17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource,UINavigationControllerDelegate,
UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) NSArray* friendsList;
@property (strong,nonatomic) NSArray* secondList;
@property (strong,nonatomic) NSArray* hobbies;
@property (strong,nonatomic) NSDictionary* personalInfo;

- (IBAction)changePasswordbtn:(id)sender;
- (IBAction)logoutBtn:(id)sender;
- (IBAction)addImage:(id)sender;

@end
