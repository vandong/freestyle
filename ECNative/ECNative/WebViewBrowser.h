//
//  WebViewBrowser.h
//  SellShop
//
//  Created by DONG HA on 10/16/12.
//  Copyright (c) 2012 DONG HA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Helper.h"

@interface WebViewBrowser : UIWebView<UIWebViewDelegate>
{
    UIView*                 vLoading;
}
@property(nonatomic, strong) NSMutableArray*         arSpecialLinks;
@property(nonatomic, strong) id<TabManagerGate>      tabManagerGateDelegate;
@end
