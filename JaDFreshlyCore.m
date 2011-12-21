//
//  JaDFreshlyCore.m
//  Freshly
//
//  Created by Enrico Ghirardi on 11/12/11.
//  Copyright (c) 2011 !cHoco Code. All rights reserved.
//

#import "JaDFreshlyCore.h"

@implementation JaDFreshlyCore

+ (NSArray *)sleepTimesGivenDate:(NSDate *)date
{
    NSMutableArray *result = [NSMutableArray array];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSHourCalendarUnit | NSMinuteCalendarUnit fromDate:date];
    NSString *ap;
    int hours = components.hour;
    int minutes = components.minute + [NSUserDefaults standardUserDefaults].minutesToSleep;
    int dhr = 0;
    if(minutes > 60) {
        minutes -= 60;
        hours += 1;
        
        if(hours >= 24) {
            if(hours == 24) {
                hours = 0; // midnight, must adjust!
            }
            else if(hours == 25) {
                hours = 1;
            }
        }
    }
    for(int ctr = 0; ctr < 6; ctr++) { // normal sleep schedule
        // add an hour and a half
        if(minutes < 30) {
            minutes += 30;
        }
        else {
            minutes -= 30;
            hours += 1;
        }
        hours += 1;
        
        if(hours == 24) {
            hours = 0;
        }
        if(hours == 25) {
            hours = 1;
        }
        
        if(hours < 12) {
            ap = @"AM";
            dhr = hours;
            if(hours == 0) {
                dhr = 12;
            }
        }
        else {
            ap = @"PM";
            dhr = hours - 12;	
        }
        if(dhr == 0) {
            dhr = 12;
        }
        if (ctr==0) {
            ;
        }
        else{
            if(minutes > 9) {
                [result addObject:[NSString stringWithFormat:@"%d:%d", dhr, minutes]];
            }
            else {
                [result addObject:[NSString stringWithFormat:@"%d:0%d", dhr, minutes]];
            }
            [result addObject:ap];
        }
    }
    return result;
}

+ (NSArray *)sleepBackHour:(int)hr minute:(int)min ap:(NSString*)an
{
    int rmin = 0;
    int rhr = 0;
    NSString *a = an;
    if(min < 30) {
        rmin = (min * 1) + (30 * 1);
        rhr = hr - 2;
    }
    else if(min >= 30) {
        rmin = min - 30;
        rhr = hr - 1;
    }
    if(rhr < 1) {
        rhr = 12 + rhr;
        
        if([a isEqualToString:@"AM"]) {
            a = @"PM";
        }
        else {
            a = @"AM";
        }
        
    }
    
    return [NSArray arrayWithObjects:[NSNumber numberWithInt:rhr], [NSNumber numberWithInt:rmin], a, nil];
}

+ (NSArray *)wakeUpTimesGiveHour:(int)hour minutes:(int)minute ap:(NSString *)ampm
{
    NSMutableArray *result = [NSMutableArray array];
    NSString *ap = ampm;
    int hours = hour;
    int minutes = minute;
    
    if(hour == 12) {
        if([ap isEqualToString:@"AM"]) {
            ap = @"PM";
        }
        else {
            ap = @"AM";
        }
    }
    
    for(int c = 1; c <= 10; c++) {
        NSArray* back = [self sleepBackHour:hours minute:minutes ap:ap];
        NSNumber *bhour = [back objectAtIndex:0];
        int nhr = bhour.intValue;
        NSNumber *bminute = [back objectAtIndex:1];
        int nmin = bminute.intValue;
        ap = [back objectAtIndex:2];
        NSString *ampmt = @"";
        ampmt = [back objectAtIndex:2];
        
        // countdown from 12, but that's not
        // how am/pm system works... whoops!
        if(nhr == 12) {
            if([ampm isEqualToString:@"AM"]) {
                ampmt = @"PM";
            }
            else {
                ampmt = @"AM";
            }
        }
        // TODO: reverse display order
        if(c == 6 || c == 4 || c == 5 || c == 3 || c == 2) {
            if(nmin > 9) {
                [result addObject:[NSString stringWithFormat:@"%d:%d", nhr, nmin]];
                [result addObject:ampmt];
            }
            else { // insert 0
                [result addObject:[NSString stringWithFormat:@"%d:0%d", nhr, nmin]];
                [result addObject:ampmt];
            }
				
        }
        hours = nhr;
        minutes = nmin;
    }
    return result.copy;
}

@end
