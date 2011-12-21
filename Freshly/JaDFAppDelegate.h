//
//  JaDFAppDelegate.h
//  Freshly
//
//  Created by Enrico Ghirardi on 23/11/11.
//  Copyright (c) 2011 !cHoco Code. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "JaDFMainViewController.h"

#import "iRate.h"

@interface JaDFAppDelegate : UIResponder <UIApplicationDelegate>
{
    UINavigationController *navController;
    UIImageView *splashView;
    JaDFMainViewController *mainViewController;
}

@property (strong, nonatomic) UIWindow *window;

@end
