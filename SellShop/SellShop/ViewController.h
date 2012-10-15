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

@interface ViewController : BaseController<UIWebViewDelegate>
{
    NSMutableArray*     arTabs;
    BOOL                bScrollAble;
    
    UIWebView*          wvPresentContent;
    UIScrollView*       srvTabContainer;
}
-(void)updateScrollViewContainer:(NSMutableArray*)arListOfTab;
@end
