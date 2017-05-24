//
//  TableViewController.m
//  LoginProject
//
//  Created by Admin on 4/24/17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "TableViewController.h"
#import "CustomTableViewCell.h"
#import "WebViewController.h"
#import "ChangePasswordViewController.h"
#import "MyCollectionCollectionViewController.h"
#import "ViewController.h"

@interface TableViewController ()
{
    NSArray *allKeys;
    NSArray *allValues;
    NSMutableArray *photos;
    
}

@end

@implementation TableViewController
- (NSMutableArray *)photos
{
    if (!photos) {
        photos = [[NSMutableArray alloc] init];
    }
    
    return photos;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _friendsList=[NSArray arrayWithObjects:@"Hager",@"Shimaa",nil];
    _secondList=[NSArray arrayWithObjects:@"Islam",@"Mohammed",nil];
    _hobbies=[NSArray arrayWithObjects:@"Programming",@"anything",nil];
    allKeys=_personalInfo.allKeys;
    allValues=_personalInfo.allValues;
    //mutableArray = [[NSMutableArray alloc] init];
    MyCollectionCollectionViewController *collectionView=[self.storyboard instantiateViewControllerWithIdentifier:@"MyCollectionCollectionViewController"];
    
    

    
    
}


//- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
//{
//
//    NSLog (@"Image picker cancelled");
//    
//    [self dismissViewControllerAnimated:YES completion:^{
//        NSLog(@"Image picker view dismissed");
//    }];
//}
//-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
//    //dismiss UIImagePickerController
//    [picker dismissViewControllerAnimated:YES completion:Nil];
//    
//    //take image from anywhere
//    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
//     if (!image) image = info[UIImagePickerControllerOriginalImage];
//   
//    [self dismissViewControllerAnimated:YES completion:^{
//        NSLog(@"Finished image picking");
//    }];
//    MyCollectionCollectionViewController *collectionView=[self.storyboard instantiateViewControllerWithIdentifier:@"MyCollectionCollectionViewController"];
//    [collectionView.galleryImages addObject:image];
//    
//    [collectionView.collectionView reloadData];
//    
////    [collectionView.galleryImages addObject:image];
////     collectionView.galleryImages= [[NSMutableArray alloc] initWithArray:mutableArray copyItems:YES];
//    [self.navigationController pushViewController:collectionView animated:YES];
//
//    
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2 ;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0)
    {
        return [_personalInfo count];
    }
    else{
        return [_secondList count];
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if(section == 0)
        return @"Personal Info";
    else
        return @"Hobbies";
}




- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 78;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"Cell";
    
    UITableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    if (indexPath.section == 0){
        
        [cell.textLabel setText:[allValues objectAtIndex:indexPath.row]];
        [cell.detailTextLabel setText:[allKeys objectAtIndex:indexPath.row]];
    }
    
    if (indexPath.section == 1)
        cell.textLabel.text = [self.hobbies objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *selectedCell=[tableView cellForRowAtIndexPath:indexPath];
    WebViewController *webview=[self.storyboard instantiateViewControllerWithIdentifier:@"WebViewController"];
    
    webview.url=selectedCell.text;
    [self.navigationController pushViewController:webview animated:YES];
    
    
}

- (IBAction)changePasswordbtn:(id)sender {
    ChangePasswordViewController *forgetPassView=[self.storyboard instantiateViewControllerWithIdentifier:@"ChangePasswordViewController"];
    [self.navigationController pushViewController:forgetPassView animated:YES];
    
}

- (IBAction)logoutBtn:(id)sender {
    
    UIAlertController *alert= [UIAlertController alertControllerWithTitle:@"Warning" message:@"Are you Sure you want to Logout?" preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *action= [UIAlertAction actionWithTitle:@"Logout" 	   style:UIAlertActionStyleDefault	 handler:^(UIAlertAction *action){
        
        NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:nil forKey:@"email"];
        [defaults synchronize];
        ViewController *forgetPassView=[self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
        [self.navigationController pushViewController:forgetPassView animated:YES];

    }];

   
    
    [alert addAction:action ];
    
    [self presentViewController:alert animated:YES completion:nil];

    
}

- (IBAction)addImage:(id)sender {
    
//    //=========== Handel Image From Gallery =========
//    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc]init];
//    imagePickerController.delegate = self;
//    imagePickerController.sourceType =  UIImagePickerControllerSourceTypePhotoLibrary;
//    [self presentViewController:imagePickerController animated:YES completion:nil];
    MyCollectionCollectionViewController *collectionView=[self.storyboard instantiateViewControllerWithIdentifier:@"MyCollectionCollectionViewController"];
   
    [self.navigationController pushViewController:collectionView animated:YES];
    
}

@end
