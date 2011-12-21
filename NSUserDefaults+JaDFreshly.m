//
//  NSUserDefaults+JaDFreshly.m
//  Freshly
//
//  Created by Enrico Ghirardi on 11/12/11.
//  Copyright (c) 2011 !cHoco Code. All rights reserved.
//

#import "NSUserDefaults+JaDFreshly.h"

static NSString* const kUserDefaultsMinutesToSleepKey = @"minutesToSleep";
static NSString* const kUserDefaultsSleepCycleDurationKey = @"sleepCycleDuration";
static NSString* const kUserDefaultsFirstLaunchSleepTimesKey = @"firstLaunchSleepTimes";
static NSString* const kUserDefaultsFirstLaunchWakeTimesKey = @"firstLaunchWakeTimes";


@implementation NSUserDefaults (JaDFreshly)

- (int)minutesToSleep
{
    NSNumber *number = [self objectForKey:kUserDefaultsMinutesToSleepKey];
    return number.intValue;
}

- (void)setMinutesToSleep:(int)minutes
{
    NSNumber *number = [NSNumber numberWithInt:minutes];
    [self setObject:number forKey:kUserDefaultsMinutesToSleepKey];
}

- (int)sleepCycleDuration
{
    NSNumber *number = [self objectForKey:kUserDefaultsSleepCycleDurationKey];
    return number.intValue;
}

- (void)setSleepCycleDuration:(int)minutes
{
    NSNumber *number = [NSNumber numberWithInt:minutes];
    [self setObject:number forKey:kUserDefaultsSleepCycleDurationKey]; 
}

- (BOOL)firstLaunchWakeTimes
{
    NSNumber *number = [self objectForKey:kUserDefaultsFirstLaunchWakeTimesKey];
    if (number) {
        return number.boolValue;

    }
    return YES;
}

- (void)setFirstLaunchWakeTimes:(BOOL)firstLaunchWakeTimes
{
    NSNumber *number = [NSNumber numberWithBool:firstLaunchWakeTimes];
    [self setObject:number forKey:kUserDefaultsFirstLaunchWakeTimesKey];
}

- (BOOL)firstLaunchSleepTimes
{
    NSNumber *number = [self objectForKey:kUserDefaultsFirstLaunchSleepTimesKey];
    if (number) {
        return number.boolValue;
        
    }
    return YES;
}

- (void)setFirstLaunchSleepTimes:(BOOL)firstLaunchSleepTimes
{
    NSNumber *number = [NSNumber numberWithBool:firstLaunchSleepTimes];
    [self setObject:number forKey:kUserDefaultsFirstLaunchSleepTimesKey];
}
@end
