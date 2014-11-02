//
//  ViewController.h
//  Waker
//
//  Created by Liuwyang on 2014-10-21.
//  Copyright (c) 2014 ECE1780. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AlarmObject.h"

@interface WakerMainViewController : UIViewController <UIAlertViewDelegate>

//@property(nonatomic) NSCalendarUnit repeatInterval;     //For repeating sound

@property (weak, nonatomic) IBOutlet UIBarButtonItem *editButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addButton;
@property (weak, nonatomic) IBOutlet UITableView *tableInMain;
@property (weak, nonatomic) IBOutlet UILabel *showTime;
@property (weak, nonatomic) IBOutlet UINavigationItem *uINavigationItem;

@property NSMutableArray *alarmSets;
- (void)scheduleLocalNotificationWithFiredate:(AlarmObject *)alarm;
- (IBAction) editButtonTapped:(UIBarButtonItem *)sender;
- (IBAction) addButtonTapped:(UIBarButtonItem *)sender;
- (IBAction)unwindClockSetting:(UIStoryboardSegue *)segue;
- (IBAction)saveAndUnwindClockSetting:(UIStoryboardSegue *)segue;


@end

