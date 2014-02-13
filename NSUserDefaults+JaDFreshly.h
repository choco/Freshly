//
//  NSUserDefaults+JaDFreshly.h
//  Freshly
//
//  Created by Enrico Ghirardi on 11/12/11.
//  Copyright (c) 2011 !cHoco Code. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (JaDFreshly)

@property (nonatomic, assign) int minutesToSleep;
@property (nonatomic, assign) int sleepCycleDuration;
@property (nonatomic, assign) BOOL firstLaunchSleepTimes;
@property (nonatomic, assign) BOOL firstLaunchWakeTimes;

@end
