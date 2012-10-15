//
//  TabObject.m
//  SellShop
//
//  Created by DONG HA on 10/15/12.
//  Copyright (c) 2012 DONG HA. All rights reserved.
//

#import "TabObject.h"
#import "TabEntity.h"

@implementation TabObject

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
    static int i =1;
//    self = [UIButton buttonWithType:UIButtonTypeCustom];
    self = [super initWithFrame:frame];
    self.frame = frame;
    if (self) {
        [self setTitle:tab.sTextOfTab forState:UIControlStateNormal];
        [self setTitleColor:[self colorWithHexString:tab.sDeactiveTextColor] forState:UIControlStateNormal];
//        [self setTintColor:[self colorWithHexString:tab.sDeactiveTextColor]];
        [self setBackgroundColor:[self colorWithHexString:tab.sDeactiveTextColor]];
        
        if (i == 1) {
            [self setBackgroundColor:[UIColor redColor]];
        }
        if (i == 2) {
            [self setBackgroundColor:[UIColor blueColor]];
        }
        if (i == 3) {
            [self setBackgroundColor:[UIColor greenColor]];
        }
        i++;
        [self setNeedsDisplay];
    }

    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
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
@end
