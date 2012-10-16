//
//  TabbarManager.h
//  SellShop
//
//  Created by DONG HA on 10/16/12.
//  Copyright (c) 2012 DONG HA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Helper.h"
@class WebViewBrowser;
@class TabViewObject;
@class ItemTabStyleEntity;

@interface TabbarManager : UIView<TabManagerGate>
{
    NSMutableArray*     arTabEntities;
    TabViewObject*      tvoActiveTab;
    ItemTabStyleEntity* defaultItemTabStyle;
}
@property(nonatomic, strong) WebViewBrowser*    wvBrowser;
@property(nonatomic, strong) UIScrollView*      srvMainTabbar;
@property(nonatomic, strong) UIScrollView*      srvContextTabbar;

-(void)updateScrollViewContainer:(NSMutableArray*)arListOfTab;
@end
