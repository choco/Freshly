//
//  JaDFreshlyCore.h
//  Freshly
//
//  Created by Enrico Ghirardi on 11/12/11.
//  Copyright (c) 2011 !cHoco Code. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NSUserDefaults+JaDFreshly.h"

@interface JaDFreshlyCore : NSObject

+ (NSArray *)sleepTimesGivenDate:(NSDate *)date;
+ (NSArray *)wakeUpTimesGiveHour:(int)hour minutes:(int)minute ap:(NSString *)ampm;

@end
