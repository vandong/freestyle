//
//  ViewController.h
//  SellShop
//
//  Created by DONG HA on 10/15/12.
//  Copyright (c) 2012 DONG HA. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BaseController.h"

//@class BaseController;
@class TabbarManager;
@class WebViewBrowser;

@interface ViewController : BaseController<UIWebViewDelegate>
{
    NSMutableArray*     arTabs;
    BOOL                bScrollAble;
    
    WebViewBrowser*     wvPresentContent;
    UIScrollView*       srvTabContainer;
    TabbarManager*      tabbarManager;
}
//-(void)updateScrollViewContainer:(NSMutableArray*)arListOfTab;
@end
