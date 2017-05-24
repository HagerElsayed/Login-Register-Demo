//
//  MyCollectionCollectionViewController.h
//  LoginProject
//
//  Created by Admin on 5/1/17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCollectionCollectionViewController : UICollectionViewController<UICollectionViewDataSource, UICollectionViewDelegate>
@property (strong, nonatomic) NSMutableArray *galleryImages;
- (IBAction)addImage:(id)sender;

@end
