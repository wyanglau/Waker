//
//  SetupClockViewController.h
//  Waker
//
//  Created by Liuwyang on 2014-10-22.
//  Copyright (c) 2014 ECE1780. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AlarmObject.h"

@interface AlarmConfigViewController : UIViewController
{
    AlarmObject *alarm;
    
}

@property (weak, nonatomic) IBOutlet UIDatePicker *timePicker;
@property NSMutableArray *configOptions; //存储页面显示的选项，现在有1.label 2.game options 3.repeat
-(NSDate*)pickCurrentDateTime;
-(AlarmObject*)getAlarm;

@end
