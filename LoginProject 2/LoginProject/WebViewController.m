//
//  WebViewController.m
//  LoginProject
//
//  Created by Admin on 4/27/17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [_webView setDelegate:self];
    //Set the URL to go to for your UIWebView
    NSString *urlAddress = _url;
    //Create a URL object.
    NSURL *url = [NSURL URLWithString:urlAddress];
    //URL Requst Object
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    //load the URL into the web view.
    [_webView loadRequest:requestObj];
    [self.view addSubview:_webView];
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
//
//- (IBAction)showWeb:(id)sender {
//   
//}
- (IBAction)showWeb:(id)sender {
    [_webView setDelegate:self];
    //Set the URL to go to for your UIWebView
    NSLog(@"%@	",_url);
    NSString *urlAddress = _url;
    //Create a URL object.
    NSURL *url = [NSURL URLWithString:urlAddress];
    //URL Requst Object
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    //load the URL into the web view.
    [_webView loadRequest:requestObj];
    [self.view addSubview:_webView];
}
@end
