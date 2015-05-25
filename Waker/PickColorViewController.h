//
//  PickColorViewController.h
//  Waker
//
//  Created by Liuwyang on 14/11/26.
//  Copyright (c) 2014年 ECE1780. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PickColorViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *redButton;
@property (weak, nonatomic) IBOutlet UIButton *blueButton;
@property (weak, nonatomic) IBOutlet UIButton *yellowButton;
@property (weak, nonatomic) IBOutlet UIButton *greenButton;
@property (weak, nonatomic) IBOutlet UIButton *blackButton;
@property (weak, nonatomic) IBOutlet UIButton *purpleButton;
@property (weak, nonatomic) IBOutlet UIButton *orangeButton;
@property (weak, nonatomic) IBOutlet UIButton *brownButton;
@property (weak, nonatomic) IBOutlet UIButton *grayButton;
@property (weak, nonatomic) IBOutlet UIButton *magButton;
@property (weak, nonatomic) IBOutlet UIButton *whiteButton;
@property (weak, nonatomic) IBOutlet UIButton *cyanButton;

- (IBAction)magAct:(id)sender;
- (IBAction)redAct:(UIButton*)sender;
- (IBAction)orangeAct:(id)sender;
- (IBAction)yellowAct:(id)sender;
- (IBAction)purpleAct:(id)sender;
- (IBAction)blueAct:(id)sender;
- (IBAction)cyanAct:(id)sender;
- (IBAction)greenAct:(id)sender;
- (IBAction)brownAct:(id)sender;
- (IBAction)blackAct:(id)sender;
- (IBAction)whiteAct:(id)sender;
- (IBAction)grayAct:(id)sender;

@property UIButton * previousSelected;
@property UIImage * currentNormalBtnBg;
@property UIImage * currentSelectedBtnBg;
@property UIImage * preNormalBtnBg;
@property UIColor * colorChosen;
@property NSString * colorInText;

@property (nonatomic, strong) NSArray* colors;

@end

