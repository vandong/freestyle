//
//  TabEntity.h
//  SellShop
//
//  Created by DONG HA on 10/15/12.
//  Copyright (c) 2012 DONG HA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TabEntity : NSObject
@property(nonatomic, strong) NSString*          sLink;
@property(nonatomic, strong) NSString*          sTextOfTab;
@property(nonatomic, strong) NSString*          sActiveTextColor;
@property(nonatomic, strong) NSString*          sActiveTranparentColor;

@property(nonatomic, strong) NSString*          sDeactiveTextColor;
@property(nonatomic, strong) NSString*          sDeactiveTranparentColor;
@end
