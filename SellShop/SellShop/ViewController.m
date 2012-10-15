//
//  ViewController.m
//  SellShop
//
//  Created by DONG HA on 10/15/12.
//  Copyright (c) 2012 DONG HA. All rights reserved.
//

#import "ViewController.h"
#import "TabObject.h"

#define DefaultWidth 64

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    bScrollAble = YES;
    wvPresentContent = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 55)];
    [self.view addSubview: wvPresentContent];
    srvTabContainer = [[UIScrollView alloc]initWithFrame:CGRectMake(0, wvPresentContent.frame.size.height, 320, 55)];
    [self.view addSubview:srvTabContainer];
    
    arTabs = [[NSMutableArray alloc]init];
    [Helper getListOfTabForObject:self];
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)updateScrollViewContainer:(NSMutableArray*)arListOfTab
{
    arTabs = arListOfTab;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone){
        if([arListOfTab count] > 5){
            if (bScrollAble) {
                for(int i = 0; i < [arListOfTab count]; i++){
                    TabObject* tabObject = [[TabObject alloc] initWithFrame:CGRectMake(i * DefaultWidth, 0, DefaultWidth, 50) andTabEntity:[arListOfTab objectAtIndex:i]];
                    [srvTabContainer addSubview:tabObject];
                    
                }
                [srvTabContainer setContentSize:CGSizeMake(DefaultWidth * [arListOfTab count], 55)];
            }
        }
    }

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
@end
