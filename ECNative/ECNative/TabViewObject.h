//
//  TabObject.h
//  SellShop
//
//  Created by DONG HA on 10/15/12.
//  Copyright (c) 2012 DONG HA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Helper.h"

@class TabEntity;
@interface TabViewObject : UIButton
@property(nonatomic, strong) TabEntity*             tabEntity;
@property(nonatomic, strong) id<TabManagerGate>  delegate;

- (id)initWithFrame:(CGRect)frame andTabEntity:(TabEntity*)tab;
- (void)updateStateToActive:(BOOL)iActive;
@end
