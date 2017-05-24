//
//  MyCollectionCollectionViewController.m
//  LoginProject
//
//  Created by Admin on 5/1/17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "MyCollectionCollectionViewController.h"
#import "MyCollectionViewCell.h"

@interface MyCollectionCollectionViewController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) NSMutableArray *photos; //Of UIImaqges

@end

@implementation MyCollectionCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (NSMutableArray *)photos
{
        
    if (!_photos) {
        _photos = [[NSMutableArray alloc] init];
    }
    
    return _photos;
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    //dismiss UIImagePickerController
   // [picker dismissViewControllerAnimated:YES completion:Nil];

    UIImage *image= info[UIImagePickerControllerEditedImage];
    if (!image) image = info[UIImagePickerControllerOriginalImage];
    
    [self.photos addObject:image];
    
    [self.collectionView reloadData];
    
    //이미지 피커 뷰 해제
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"Finished image picking");
    }];


}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    
    
    NSLog (@"Image picker cancelled");
    
    //이미지 피커 뷰 해제
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"Image picker view dismissed");
    }];
}




- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
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

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

   return self.photos.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MyCollectionViewCell *cell= [collectionView
                                    dequeueReusableCellWithReuseIdentifier:@"MyCell"
                                    forIndexPath:indexPath];
    
//    UIImage *image;
//    long row = [indexPath row];
//    
//    image = [UIImage imageNamed:self.photos[row]];
//    
//    myCell.imageview.image = image;
//    
//    return myCell;
    cell.backgroundColor = [UIColor whiteColor];
    cell.imageview.image = self.photos[indexPath.row];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

- (IBAction)addImage:(id)sender {
        //=========== Handel Image From Gallery =========
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc]init];
        imagePickerController.delegate = self;
        imagePickerController.sourceType =  UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:imagePickerController animated:YES completion:nil];
}
@end
