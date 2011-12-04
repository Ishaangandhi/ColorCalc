//
//  CalculatorAppDelegate.m
//  Calculator
//
//  Created by Ishaan Gandhi on 5/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CalculatorAppDelegate.h"

#import "CalculatorViewController.h"

@implementation CalculatorAppDelegate


@synthesize window=_window;

@synthesize viewController=_viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)dealloc
{
    [_window release];
    [_viewController release];
    [super dealloc];
}

@end
