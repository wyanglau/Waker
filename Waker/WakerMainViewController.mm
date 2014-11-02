//
//  ViewController.m
//  Waker
//
//  Created by Liuwyang on 2014-10-21.
//  Copyright (c) 2014 ECE1780. All rights reserved.
//

#import "WakerMainViewController.h"
#import "PicturingViewController.h"
#import "AlarmConfigViewController.h"
#import "AlarmObject.h"



@interface WakerMainViewController ()

@end
static  NSString* EDIT=@"Edit";
static  NSString* DONE=@"Done";
static NSString* ALARM_INDEX=@"AlarmIndex";
@implementation WakerMainViewController
@synthesize showTime;
@synthesize editButton;
@synthesize uINavigationItem;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    
}

- (void)initData{
    self.view.backgroundColor = [UIColor colorWithPatternImage: [UIImage imageNamed:@"Screen5.png"]];
    
    self.editButton.title= NSLocalizedString(EDIT, EDIT);
    
    [NSTimer scheduledTimerWithTimeInterval:1.0
                                     target:self
                                   selector:@selector(driveClock:)
                                   userInfo:nil
                                    repeats:YES];
    
    
    self.alarmSets = [[NSMutableArray alloc] init];
    
    [self loadInitialAlarmsFromFile];
    
    
}

-(void)driveClock:(NSTimer *)timer{
    
    //to do 在不用localnotification的情况下触发闹钟
    NSDate *date = [NSDate date];
    showTime.text= [self dateFormatter:date];
    
    
}

-(NSString*)dateFormatter:(NSDate*)date{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    dateFormatter.timeZone = [NSTimeZone defaultTimeZone];
    dateFormatter.timeStyle=NSDateFormatterShortStyle;
    return [dateFormatter stringFromDate:date];
}

- (void)loadInitialAlarmsFromFile{
    //to do ... Load initial alarm clocks from storage
    
    //--test    data
//    AlarmObject* obj = [[AlarmObject alloc]init];
//    obj.label = @"label";
//    obj.time = [NSDate date];
//    obj.isRepeat=YES;
//    [self.alarmSets addObject:obj];
//    
//    AlarmObject* obj2 = [[AlarmObject alloc]init];
//    obj2.label = @"label";
//    obj2.time = [NSDate date];
//    obj2.isRepeat=YES;
//    [self.alarmSets addObject:obj2];
    
    //    //-test
}
- (IBAction) addButtonTapped:(UIBarButtonItem *)sender{
    
    NSLog(@"add button tapped");
    
}

- (IBAction) editButtonTapped:(UIBarButtonItem*)sender{
    
    BOOL isEditing = !self.tableInMain.editing;
    if(isEditing){
        self.editButton.title = NSLocalizedString(DONE, DONE);
        self.editButton.style = UIBarButtonItemStyleDone;
    }
    else{
        
        self.editButton.title = NSLocalizedString(EDIT, EDIT);
        self.editButton.style = UIBarButtonItemStylePlain;
        
    }
    [self setEditing:isEditing animated:YES];
    
    
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    [self.tableInMain setEditing:editing animated:YES];
    if (editing) {
        self.addButton.enabled = NO;
    } else {
        self.addButton.enabled = YES;
    }
}
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    AlarmObject * alarm = [self.alarmSets objectAtIndex:indexPath.row];
    // If row is deleted, remove it from the list.
    if (editingStyle == UITableViewCellEditingStyleDelete) {
      // WakerMainViewController *controller = (WakerMainViewController *)[[UIApplication sharedApplication] delegate];
       [self removeAlarmObjectFromListAtIndex:indexPath.row];
        [self.tableInMain deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        //Cancel the localnotification
        [self cancelLocalNotificationWithAlarm:alarm];
    }
}

-(void)removeAlarmObjectFromListAtIndex:(NSInteger)index{
    [self.alarmSets removeObjectAtIndex:index];

}

-(void)removeAlarmObjectFromList:(AlarmObject*)alarm{
    [self.alarmSets removeObject:alarm];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scheduleLocalNotificationWithFiredate:(AlarmObject *)alarm{
    
    NSDate* fireDate = alarm.time;
    UILocalNotification *notification = [[UILocalNotification alloc]init];
    notification.fireDate=fireDate;
    notification.alertBody=@"Get Up!";
    notification.soundName= @"Alarm.caf";
    notification.repeatInterval = kCFCalendarUnitDay;
    
    //把index当做notification ID
    NSDictionary *infoDict = [NSDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"%ld",(long)alarm.index],ALARM_INDEX, nil];
    notification.userInfo = infoDict;
    NSLog(@"The current index is :%ld . Adding localNotification, infoDict = %@",(long)alarm.index,infoDict);
    
    [[UIApplication sharedApplication]scheduleLocalNotification:notification];
    NSLog(@"[WakerMainViewController] : Notification done!");
    
    
}
-(void)cancelLocalNotificationWithAlarm:(AlarmObject*)alarm{
    NSString * index = [NSString stringWithFormat:@"%ld",(long)alarm.index];
    
    NSArray *notifications = [[UIApplication sharedApplication] scheduledLocalNotifications];
    for (UILocalNotification *notification in notifications ) {
        if( [[notification.userInfo objectForKey:ALARM_INDEX] isEqualToString:index] ) {
            NSLog(@"Canceling Notification AlarmIndex=%@",index);
            [[UIApplication sharedApplication] cancelLocalNotification:notification];
            break;
        }
    }
}

- (void)testAlert{
    
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Title" message:@"Message 1......\nMessage 2......" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    [alert show];
    
}

- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"Button canceled!");
    switch (buttonIndex) {
        case 0:
            NSLog(@"Cancel Button Pressed");
            break;
        case 1:
            NSLog(@"Button 1 Pressed");
            break;
        case 2:
            NSLog(@"Button 2 Pressed");
            break;
        case 3:
            NSLog(@"Button 3 Pressed");
            break;
        default:
            break;
    }
    //    PicturingViewController *show = [[PicturingViewController alloc] init];
    //    [self.navigationController pushViewController:show animated:YES];
}
- (IBAction)unwindClockSetting:(UIStoryboardSegue *)segue{
    
    NSLog(@"[WakerMainViewController] : cancelUnwind");
    
}
- (IBAction)saveAndUnwindClockSetting:(UIStoryboardSegue *)segue{
    
    
    //Get the previous view from segue
    AlarmConfigViewController *config = segue.sourceViewController;
    if (config != nil) {
        AlarmObject * alarm = config.alarm;
        [self addAlarms:alarm];

        NSLog(@"Save alarm %@ and unwind!",config.alarm.time);
    }
}

- (void)addAlarms:(AlarmObject*)alarm{
    if(alarm!=nil){
        [self.alarmSets addObject:alarm];
        NSLog(@"[WakerMainViewController] : Alarm added to alarmSets:%@",alarm.time);
    }
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.alarmSets count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell;
    NSString* alarm_identifier = @"1";
    NSInteger index= indexPath.row;
    AlarmObject *alarm = [self.alarmSets objectAtIndex:index];
    
    //Set the row index of alarm
    alarm.index=index;
    [self modifyAlarm:alarm];
    
    cell = [tableView dequeueReusableCellWithIdentifier:alarm_identifier forIndexPath:indexPath];
    cell.textLabel.text = [self dateFormatter:alarm.time];
    
     [self scheduleLocalNotificationWithFiredate:alarm];
    
    
    UISwitch *switchView = [[UISwitch alloc] init];
    cell.accessoryView = switchView;
    
    //闹钟初始状态需要从文件读~ TO-----DO-------
     [switchView setOn:YES animated:NO];
    switchView.tag= index;
    [switchView addTarget:self action:@selector(switchChanged:) forControlEvents: UIControlEventValueChanged];
    
    return cell;
}
- (void) switchChanged:(UISwitch*)switcher{
    NSInteger index = switcher.tag;
    AlarmObject* alarm = [self.alarmSets objectAtIndex:index];
    if(switcher.isOn){
        [self turnOnAlarm:alarm];
    }
    else{
        [self turnOffAlarm:alarm];
    }
    
    NSLog( @" WakerMainViewController : switch %ld is %@", (long)switcher.tag, switcher.on ? @"ON" : @"OFF" );
    
}

-(void)turnOnAlarm:(AlarmObject*)alarm{
    alarm.isOn=YES;
    [self modifyAlarm:alarm];
     [self scheduleLocalNotificationWithFiredate:alarm];
}

-(void)turnOffAlarm:(AlarmObject*)alarm{
    alarm.isOn=NO;
    [self modifyAlarm:alarm];
    [self cancelLocalNotificationWithAlarm:alarm];
}

-(void)modifyAlarm:(AlarmObject*)alarm;{
 
    [self.alarmSets setObject:alarm atIndexedSubscript:alarm.index];
}

@end

