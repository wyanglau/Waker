//
//  CommonUtils.m
//  Waker
//
//  Created by Liuwyang on 2014-11-03.
//  Copyright (c) 2014 ECE1780. All rights reserved.
//

#import "CommonUtils.h"

@implementation CommonUtils
NSString* const ALARM_INDEX=@"AlarmIndex";
NSString* const ALARM_COLOR=@"AlarmColor";
+(int)compareDate:(NSDate *)expected withCurrentDay:(NSDate *)currentDay
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //如果format含ss，则更精确
    [dateFormatter setDateFormat:@"dd-MM-yyyy-hh-mm"];
    
    NSString *expectedStr = [dateFormatter stringFromDate:expected];
    NSString *currentDayStr = [dateFormatter stringFromDate:currentDay];
    NSDate *dateA = [dateFormatter dateFromString:expectedStr];
    NSDate *dateB = [dateFormatter dateFromString:currentDayStr];
    NSComparisonResult result = [dateA compare:dateB];
    NSLog(@"date1 : %@, date2 : %@", expected, currentDay);
    if (result == NSOrderedDescending) {
        return 1;
    }
    else if (result == NSOrderedAscending){

        return -1;
    }

    return 0;
    
}

@end
