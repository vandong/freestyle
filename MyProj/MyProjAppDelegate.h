//
//  MyProjAppDelegate.h
//  MyProj
//
//  Created by Douglas Sjoquist on 5/28/11.
//  Copyright 2011 Ivy Gulch, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MyProjViewController;

@interface MyProjAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet MyProjViewController *viewController;

@end
