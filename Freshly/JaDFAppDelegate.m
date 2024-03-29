//
//  JaDFAppDelegate.m
//  Freshly
//
//  Created by Enrico Ghirardi on 23/11/11.
//  Copyright (c) 2011 !cHoco Code. All rights reserved.
//

#import "JaDFAppDelegate.h"

#define kCornerRadius 15.f

@implementation JaDFAppDelegate

@synthesize window = _window;

+ (void)initialize
{
    //configure iRate
    [iRate sharedInstance].appStoreID = 490258111;
}

- (void)startupAnimationDone
{
    [mainViewController startupAnimationDone];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    mainViewController = [[JaDFMainViewController alloc] initWithNibName:@"JadFMainViewController" bundle:nil];
    navController = [[UINavigationController alloc] initWithRootViewController:mainViewController];
    navController.delegate = mainViewController;
    navController.navigationBarHidden = YES;
    [self.window addSubview:navController.view];
    self.window.backgroundColor = [UIColor blackColor];
    [self.window makeKeyAndVisible];
    
    splashView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Default"]];
    [splashView setFrame:CGRectMake(splashView.frame.origin.x, splashView.frame.origin.y+20, splashView.frame.size.width, splashView.frame.size.height)];
    [self.window addSubview:splashView];
    [self.window bringSubviewToFront:splashView];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:self.window cache:YES];
    [UIView setAnimationDelegate:self]; 
    [UIView setAnimationDidStopSelector:@selector(startupAnimationDone)];
    splashView.alpha = 0.0;    
    [UIView commitAnimations];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
