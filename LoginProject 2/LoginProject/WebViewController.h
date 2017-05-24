//
//  WebViewController.h
//  LoginProject
//
//  Created by Admin on 4/27/17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (strong,nonatomic) NSString* url;
- (IBAction)showWeb:(id)sender;


@end
