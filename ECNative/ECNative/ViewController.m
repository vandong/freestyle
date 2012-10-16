//
//  ViewController.m
//  SellShop
//
//  Created by DONG HA on 10/15/12.
//  Copyright (c) 2012 DONG HA. All rights reserved.
//

#import "ViewController.h"
#import "TabbarManager.h"
#import "WebViewBrowser.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    bScrollAble = YES;
    wvPresentContent = [[WebViewBrowser alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 55)];
//    wvPresentContent.delegate = self;
    [self.view addSubview: wvPresentContent];
//    srvTabContainer = [[UIScrollView alloc]initWithFrame:CGRectMake(0, wvPresentContent.frame.size.height, 320, 55)];
//    [self.view addSubview:srvTabContainer];
    tabbarManager = [[TabbarManager alloc] initWithFrame:CGRectMake(0, wvPresentContent.frame.size.height, 320, 55)];
    tabbarManager.wvBrowser = wvPresentContent;
    [self.view addSubview:tabbarManager];
    arTabs = [[NSMutableArray alloc]init];
    [Helper getListOfTabForObject:tabbarManager];
    
    
	// Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
           
}


- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    return  YES;
}

-(void)openLink:(NSString*)link
{
    
}
@end
