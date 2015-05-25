//
//  CommonUtils.h
//  Waker
//
//  Created by Liuwyang on 2014-11-03.
//  Copyright (c) 2014 ECE1780. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommonUtils : NSObject

extern  NSString* const ALARM_INDEX;
extern  NSString* const ALARM_COLOR;

//Return
// 0 : same date
// 1 : expected day is in the future
//-1 : expected day has passed
+(int)compareDate:(NSDate *)expected withCurrentDay:(NSDate *)currentDay;
@end
