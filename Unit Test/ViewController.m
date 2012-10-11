//
//  ViewController.m
//  Unit Test
//
//  Created by DONG HA on 10/10/12.
//  Copyright (c) 2012 DONG HA. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSTimeInterval)waitTillReady:(BOOL (^)())isReady timeout:(NSTimeInterval)seconds {
    NSTimeInterval start = [NSDate timeIntervalSinceReferenceDate];
    NSDate *loopUntil = [NSDate dateWithTimeIntervalSinceNow:seconds];
    
    while (isReady() == NO &amp;&amp; [loopUntil timeIntervalSinceNow] &gt; 0) {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:loopUntil];
    }
    
    NSTimeInterval finish = [NSDate timeIntervalSinceReferenceDate];
    return (finish - start);
}

- (void)testMessage
{
    PPPostMessage *message = [[PPPostMessage alloc] init];
    STAssertTrue(message.isRequesting, @"should automatically start requesting (currently)");
    
    NSTimeInterval delay = [self waitTillReady:^BOOL{
        return message.isLoading;
    } timeout:5];
    STAssertTrue(message.isLoading, @"expecting it to start loading in 5 second");
    NSLog(@"[%@ %@] load statup delay = %f", NSStringFromClass([self class]), NSStringFromSelector(_cmd), delay );
    
    delay = [self waitTillReady:^BOOL{
        return message.isLoaded;
    } timeout:20 - delay];
    STAssertTrue(message.isLoaded, @"expecting it to be loaded in 20 seconds");
    NSLog(@"[%@ %@] load time = %f", NSStringFromClass([self class]), NSStringFromSelector(_cmd), delay );
}
@end
