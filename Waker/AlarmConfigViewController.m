//
//  SetupClockViewController.m
//  Waker
//
//  Created by Liuwyang on 2014-10-22.
//  Copyright (c) 2014 ECE1780. All rights reserved.
//

#import "AlarmConfigViewController.h"
#import "ALarmConfigObject.h"

@interface AlarmConfigViewController ()

@end

@implementation AlarmConfigViewController
@synthesize timePicker;
@synthesize alarm;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    
}

-(void)initData{
    
    self.configOptions = [[NSMutableArray alloc] init];
    alarm = [[AlarmObject alloc]init];
    
    [self loadInitialData];
    
    timePicker.date=[NSDate date];
    
}

-(void)loadInitialData{
    
    ALarmConfigObject *optionLabel = [[ALarmConfigObject alloc]init];
    optionLabel.configOptionName = OPTION_LABEL;
    [self.configOptions addObject:optionLabel];
    
    ALarmConfigObject *optionGame = [[ALarmConfigObject alloc]init];
    optionGame.configOptionName = OPTION_GAME;
    [self.configOptions addObject:optionGame];
    
    
    ALarmConfigObject *optionRepeat = [[ALarmConfigObject alloc]init];
    optionRepeat.configOptionName = OPTION_REPEAT;
    [self.configOptions addObject:optionRepeat];
    
}
// Be careful, here returns the date without TimeZone formatter.
-(NSDate*)pickCurrentDateTime{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    dateFormatter.timeZone = [NSTimeZone defaultTimeZone];
    dateFormatter.timeStyle=NSDateFormatterShortStyle;
    dateFormatter.dateStyle=NSDateFormatterShortStyle;
    NSString *dateTimeString = [self dateFormatter:timePicker.date];
    NSLog(@"AlarmConfigViewController : dateTimePick:%@",dateTimeString);
    
    return timePicker.date;
}
-(NSString*)dateFormatter:(NSDate*)date{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    dateFormatter.timeZone = [NSTimeZone defaultTimeZone];
    dateFormatter.timeStyle=NSDateFormatterShortStyle;
    dateFormatter.dateStyle=NSDateFormatterShortStyle;
    
    return [dateFormatter stringFromDate:date];
}

-(IBAction)saveButtonPress:(id)sender{
    NSLog(@"Save Button Pressed");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Method for tableview in AlarmConfigView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.configOptions count];
}

////Show view of table
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell;
    ALarmConfigObject *config = [self.configOptions objectAtIndex:indexPath.row];
    cell = [tableView dequeueReusableCellWithIdentifier:config.configOptionName forIndexPath:indexPath];
    cell.textLabel.text = config.configOptionName;
    
    if((config.configOptionName == OPTION_REPEAT)&&(indexPath.row==2))
    {
        UISwitch *switchView = [[UISwitch alloc] init];
        cell.accessoryView = switchView;
        [switchView setOn:NO animated:NO];
        [switchView addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventValueChanged];
    }
    
    
    return cell;
}
- (void) switchChanged:(UISwitch*)sender {
    UISwitch* switchControl = sender;   
    [self setRepeat:switchControl.on];
    NSLog( @"Repeat switch is %@", switchControl.on ? @"ON" : @"OFF" );
  
}


-(void)setRepeat:(BOOL)repeatControl{
    alarm.isRepeat=repeatControl;
}
-(void)setGameOption:(NSInteger*)option{
    alarm.gameOption=option;
}
-(void)setLabel:(NSString*)label{
    alarm.label=label;
}
-(void)setPickedDate:(NSDate*)time{
    alarm.time=time;
}
-(void)setAlarmIndex:(NSInteger)index{
    alarm.index=index;
}
//-(AlarmObject*)getAlarm{
//    return alarm;
//}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    NSLog(@"AlarmConfigViewController Setting Alarm Time: %@",[self pickCurrentDateTime]);
    [self setPickedDate:[self pickCurrentDateTime]];
}


@end
