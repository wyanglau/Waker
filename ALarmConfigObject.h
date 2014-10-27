//
//  AlarmConfigData.h
//  Waker
//
//  Created by Liuwyang on 2014-10-25.
//  Copyright (c) 2014 ECE1780. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ALarmConfigObject : NSObject
extern  NSString* const OPTION_GAME;
extern  NSString* const OPTION_REPEAT;
extern  NSString* const OPTION_LABEL;

@property NSString *configOptionName; //设置选项名，现在有1.label 2.game options 3.repeat

@end
