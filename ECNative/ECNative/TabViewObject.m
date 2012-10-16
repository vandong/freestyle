//
//  TabObject.m
//  SellShop
//
//  Created by DONG HA on 10/15/12.
//  Copyright (c) 2012 DONG HA. All rights reserved.
//

#import "TabViewObject.h"
#import "TabEntity.h"
#import <QuartzCore/QuartzCore.h>

@implementation TabViewObject
@synthesize delegate;
@synthesize tabEntity;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame andTabEntity:(TabEntity*)tab
{
//    self = [UIButton buttonWithType:UIButtonTypeCustom];
    self = [super initWithFrame:frame];
    self.frame = frame;
    if (self) {
        tabEntity = tab;
        [self setTitle:tab.sTextOfTab forState:UIControlStateNormal];
        [self setTitleColor:[self colorWithHexString:tab.sDeactiveTextColor] forState:UIControlStateNormal];
//        [self setTintColor:[self colorWithHexString:tab.sDeactiveTextColor]];
        [self setBackgroundColor:[self colorWithHexString:tab.sDeactiveTranparentColor]];
        [[self layer] setBorderWidth:0.5f];
        [[self layer] setBorderColor:[UIColor purpleColor].CGColor];
       
        [self addTarget: self action:@selector(singleTab:) forControlEvents:UIControlEventTouchUpInside];
        [self addTarget: self action:@selector(doubleTab:) forControlEvents:UIControlEventTouchDownRepeat];
    }

    return self;
}

-(void)singleTab:(id)sender
{
    [self.delegate openLinkForTab:self];
}
-(void)doubleTab:(id)sender
{
    [self.delegate openHistoryForTab:self];
}

-(UIColor*)colorWithHexString:(NSString*)hex
{
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor grayColor];
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    
    if ([cString length] != 6) return  [UIColor grayColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}

- (void)drawRect:(CGRect)rect
{
    UIColor* color = self.backgroundColor;
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(context);
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
//    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, [NSArray arrayWithObject:color], (const CGFloat[2]){0.0f,1.0f});
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace,
//     (const CGFloat[8]){0.5f, 0.0f, 0.0f, 1.0f, 0.0f, 1.0f, 0.0f, 1.0f},
                                                                 CGColorGetComponents(color.CGColor),
     (const CGFloat[2]){0.3f,0.7f},
     2);
    
    CGContextDrawLinearGradient(context,
                                gradient,
                                CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMinY(self.bounds)),
                                CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMaxY(self.bounds)),
                                0);
    
    CGColorSpaceRelease(colorSpace);
    CGContextRestoreGState(context);
}

- (void)updateStateToActive:(BOOL)iActive
{
    if (iActive) {
        [self setTitleColor:[self colorWithHexString:tabEntity.sActiveTextColor] forState:UIControlStateNormal];
        //        [self setTintColor:[self colorWithHexString:tab.sDeactiveTextColor]];
        [self setBackgroundColor:[self colorWithHexString:tabEntity.sActiveTranparentColor]];
    }
    else{
        [self setTitleColor:[self colorWithHexString:tabEntity.sDeactiveTextColor] forState:UIControlStateNormal];
        //        [self setTintColor:[self colorWithHexString:tab.sDeactiveTextColor]];
        [self setBackgroundColor:[self colorWithHexString:tabEntity.sDeactiveTranparentColor]];
        
    }
    [self setNeedsDisplay];
}
@end
