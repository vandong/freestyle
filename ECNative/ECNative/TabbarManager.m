//
//  TabbarManager.m
//  SellShop
//
//  Created by DONG HA on 10/16/12.
//  Copyright (c) 2012 DONG HA. All rights reserved.
//

#import "TabbarManager.h"
#import "TabViewObject.h"
#import "TabEntity.h"
#import "WebViewBrowser.h"

#define DefaultWidth 64

@implementation TabbarManager
@synthesize wvBrowser;
@synthesize srvMainTabbar;
@synthesize srvContextTabbar;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        srvMainTabbar = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, frame.size.height)];
        srvMainTabbar.backgroundColor = [UIColor redColor];
        [self addSubview:srvMainTabbar];
//        srvContextTabbar = [[UIScrollView alloc]initWithFrame:frame];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

-(void)updateScrollViewContainer:(NSMutableArray*)arListOfTab
{
    arTabEntities = arListOfTab;
    BOOL bScrollAble = YES;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone){
        if([arListOfTab count] >= 5){
            if (bScrollAble) {
                for(int i = 0; i < [arListOfTab count]; i++){
                    TabViewObject* tabObject = [[TabViewObject alloc] initWithFrame:CGRectMake(i * DefaultWidth, 0, DefaultWidth, 50) andTabEntity:[arListOfTab objectAtIndex:i]];
                    tabObject.delegate = self;
                    [srvMainTabbar addSubview:tabObject];
                }
                [srvMainTabbar setContentSize:CGSizeMake(DefaultWidth * [arListOfTab count], 55)];
            }
        }
        else {
            float iNewWidth = 320 / [arListOfTab count];
            for(int i = 0; i < [arListOfTab count]; i++){
                TabViewObject* tabObject = [[TabViewObject alloc] initWithFrame:CGRectMake(i * iNewWidth, 0, iNewWidth, 50) andTabEntity:[arListOfTab objectAtIndex:i]];
                if (i == ([arListOfTab count] - 1)) {
                    tabObject.frame = CGRectMake(i * iNewWidth, 0, 320 - iNewWidth * i, 50);
                }
                tabObject.delegate = self;
                [srvMainTabbar addSubview:tabObject];
            }
            [srvMainTabbar setContentSize:CGSizeMake(320, 55)];
        }
    }
}

#pragma mark TabObjectProtocal
-(void)openHistoryForTab:(TabViewObject*)tab
{
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"alert" message:@"open history scroll" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}
-(void)openLinkForTab:(TabViewObject *)tab
{
    NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL URLWithString:tab.tabEntity.sLink]];
    [wvBrowser loadRequest:request];
}
@end
