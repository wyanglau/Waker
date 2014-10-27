//
//  AlarmObject.h
//  Waker
//
//  Created by Liuwyang on 2014-10-26.
//  Copyright (c) 2014 ECE1780. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AlarmObject : NSObject

@property NSString* index;
@property NSDate* time;
@property NSInteger* gameOption;
@property BOOL isRepeat;
@property NSString* label;
@property BOOL isOn;

@end
