//
//  Helper.m
//  SellShop
//
//  Created by DONG HA on 10/15/12.
//  Copyright (c) 2012 DONG HA. All rights reserved.
//

#import "Helper.h"
#import "Reachability.h"
#import "ASIHTTPRequest.h"
#import "JSON.h"
#import "TabEntity.h"

@implementation Helper

+(BOOL)checkConnection {
    BOOL r = YES;
    
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus internetStatus = [reachability currentReachabilityStatus];
    if (internetStatus == NotReachable) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:NSLocalizedString(@"error_network_lose", nil) delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        r= NO;
    }
    
    return r;
}

+(void)getListOfTabForObject:(NSObject*)obj
{
    if (![self checkConnection]) return;

    
    NSString *url = @"http://192.168.1.15/json.txt";
    __block ASIHTTPRequest *request = [[ASIHTTPRequest alloc] initWithURL:[NSURL URLWithString:url]];
    
    [request setCompletionBlock:^{
        NSMutableArray* arListOfTab = [[NSMutableArray alloc]init];        
        NSString *responseString = request.responseString;
        NSDictionary *dict = [responseString JSONValue];
        dict = [dict objectForKey:@"ListTab"];
        NSMutableArray* arTabs = [dict objectForKey:@"Tabs"];
        for(int i =0; i < [arTabs count]; i++){
            NSDictionary* dictTab = [arTabs objectAtIndex:i];
            TabEntity* tabEntity = [[TabEntity alloc] init];
            tabEntity.sLink = [dictTab objectForKey:@"link"];
            tabEntity.sTextOfTab = [dictTab objectForKey:@"text"];
            tabEntity.sActiveTextColor = [dictTab objectForKey:@"active_text_color"];
            tabEntity.sActiveTranparentColor = [dictTab objectForKey:@"active_background"];
            tabEntity.sDeactiveTextColor = [dictTab objectForKey:@"deactive_text_color"];
            tabEntity.sDeactiveTranparentColor = [dictTab objectForKey:@"deactive_background"];
            [arListOfTab addObject:tabEntity];
        }
        [obj performSelector:@selector(updateScrollViewContainer:) withObject:arListOfTab];
    }];
    [request setFailedBlock:^{
        
    }];
    [request startAsynchronous];
    
    
}

@end
