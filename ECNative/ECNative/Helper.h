//
//  Helper.h
//  SellShop
//
//  Created by DONG HA on 10/15/12.
//  Copyright (c) 2012 DONG HA. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TabViewObject;

@interface Helper : NSObject
+(void)getListOfTabForObject:(NSObject*)obj;
+ (NSDictionary*)parseURLParams:(NSString *)query;
@end


@protocol TabManagerGate <NSObject>
@optional
-(void)openHistoryForTab:(TabViewObject*)tab;
-(void)openContextScrollViewForTab:(TabViewObject*)tab;
-(void)openLinkForTab:(TabViewObject*)tab;
-(void)changeStyle:(NSInteger)iStyle;
@end