//
//  WebViewBrowser.m
//  SellShop
//
//  Created by DONG HA on 10/16/12.
//  Copyright (c) 2012 DONG HA. All rights reserved.
//

#import "WebViewBrowser.h"

@implementation WebViewBrowser
@synthesize arSpecialLinks;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        vLoading = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        UIActivityIndicatorView* aidLoading = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(self.frame.size.width/2 - 20, self.frame.size.height/2 - 20, 40, 40)];
        [aidLoading startAnimating];
        [vLoading addSubview:aidLoading];
        vLoading.backgroundColor = [UIColor colorWithWhite:0.7f alpha:0.7f];
        self.delegate = self;
    }
    return self;
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [vLoading removeFromSuperview];
}
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    if([arSpecialLinks indexOfObject: webView.request.URL.absoluteString] != NSNotFound){
        NSMutableDictionary* dictParams = [Helper parseURLParams:request.URL.parameterString];
        NSString* sStyle = [dictParams objectForKey:@"style"];
        @try {
            [self.tabManagerGateDelegate changeStyle:[sStyle intValue]];
        }
        @catch (NSException *exception) {
            
        }
        
    }
    [self addSubview:vLoading];
    return YES;
}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [vLoading removeFromSuperview];
}
@end
