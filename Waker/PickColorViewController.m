//
//  PickColorViewController.m
//  Waker
//
//  Created by Liuwyang on 14/11/26.
//  Copyright (c) 2014年 ECE1780. All rights reserved.
//

#import "PickColorViewController.h"

@interface PickColorViewController ()

@end

@implementation PickColorViewController
@synthesize colorChosen;
@synthesize colorInText;
@synthesize colors;
@synthesize previousSelected;
@synthesize preNormalBtnBg;
@synthesize currentNormalBtnBg;
@synthesize currentSelectedBtnBg;
- (void)viewDidLoad {
    [super viewDidLoad];

    
}
#pragma mark - Private
- (NSString*)hexCodeFromColor:(UIColor *)color
{
    CGFloat red = 0.0, green = 0.0, blue = 0.0, alpha = 0.0;
    [color getRed:&red green:&green blue:&blue alpha:&alpha];
    
    return [NSString stringWithFormat:@"#%02X%02X%02X", (int)(red * 255.0f), (int)(green * 255.0f), (int)(blue * 255.0f)];
}


-(void)pickColor:(UIButton *)btn color: (UIColor*)color{
    [btn setBackgroundImage:self.currentSelectedBtnBg forState:UIControlStateNormal];
    if(previousSelected != btn){
        [self.previousSelected setBackgroundImage:preNormalBtnBg forState:UIControlStateNormal];}
    self.previousSelected=btn;
    self.preNormalBtnBg = currentNormalBtnBg;
    self.colorChosen=color;
    self.colorInText=[self hexCodeFromColor:colorChosen];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)magAct:(id)sender {
    self.currentNormalBtnBg = [UIImage imageNamed:@"/Users/liuwyang/Downloads/Waker/magenta.png"];
    self.currentSelectedBtnBg = [UIImage imageNamed:@"/Users/liuwyang/Downloads/Waker/magentaselected.png"];
    [self pickColor:sender color:[UIColor magentaColor]];
}

- (IBAction)redAct:(UIButton*)sender {
  
    self.currentNormalBtnBg = [UIImage imageNamed:@"/Users/liuwyang/Downloads/Waker/red.png"];
    self.currentSelectedBtnBg = [UIImage imageNamed:@"/Users/liuwyang/Downloads/Waker/redselect.png"];
    [self pickColor:sender color:[UIColor redColor]];
    
}

- (IBAction)orangeAct:(id)sender {
    
    self.currentNormalBtnBg = [UIImage imageNamed:@"/Users/liuwyang/Downloads/Waker/orange.png"];
    self.currentSelectedBtnBg = [UIImage imageNamed:@"/Users/liuwyang/Downloads/Waker/orangeselected.png"];
    [self pickColor:sender color:[UIColor orangeColor]];
}

- (IBAction)yellowAct:(id)sender {
    self.currentNormalBtnBg = [UIImage imageNamed:@"/Users/liuwyang/Downloads/Waker/yellow.png"];
    self.currentSelectedBtnBg = [UIImage imageNamed:@"/Users/liuwyang/Downloads/Waker/yellowselected.png"];
    [self pickColor:sender color:[UIColor yellowColor]];
}

- (IBAction)purpleAct:(id)sender {
    self.currentNormalBtnBg = [UIImage imageNamed:@"/Users/liuwyang/Downloads/Waker/purple.png"];
    self.currentSelectedBtnBg = [UIImage imageNamed:@"/Users/liuwyang/Downloads/Waker/purpleselected.png"];
    [self pickColor:sender color:[UIColor purpleColor]];
}

- (IBAction)blueAct:(id)sender {
    self.currentNormalBtnBg = [UIImage imageNamed:@"/Users/liuwyang/Downloads/Waker/blue.png"];
    self.currentSelectedBtnBg = [UIImage imageNamed:@"/Users/liuwyang/Downloads/Waker/blueselected.png"];
    [self pickColor:sender color:[UIColor blueColor]];
}

- (IBAction)cyanAct:(id)sender {
    self.currentNormalBtnBg = [UIImage imageNamed:@"/Users/liuwyang/Downloads/Waker/Cyan.png"];
    self.currentSelectedBtnBg = [UIImage imageNamed:@"/Users/liuwyang/Downloads/Waker/Cyanselected.png"];
    [self pickColor:sender color:[UIColor cyanColor]];
}

- (IBAction)greenAct:(id)sender {
    self.currentNormalBtnBg = [UIImage imageNamed:@"/Users/liuwyang/Downloads/Waker/green.png"];
    self.currentSelectedBtnBg = [UIImage imageNamed:@"/Users/liuwyang/Downloads/Waker/greenselected.png"];
    [self pickColor:sender color:[UIColor greenColor]];
}

- (IBAction)brownAct:(id)sender {
    self.currentNormalBtnBg = [UIImage imageNamed:@"/Users/liuwyang/Downloads/Waker/brown.png"];
    self.currentSelectedBtnBg = [UIImage imageNamed:@"/Users/liuwyang/Downloads/Waker/brownselected.png"];
    [self pickColor:sender color:[UIColor brownColor]];
}

- (IBAction)blackAct:(id)sender {
    self.currentNormalBtnBg = [UIImage imageNamed:@"/Users/liuwyang/Downloads/Waker/black.png"];
    self.currentSelectedBtnBg = [UIImage imageNamed:@"/Users/liuwyang/Downloads/Waker/blackselected.png"];
    [self pickColor:sender color:                                [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0]];
}

- (IBAction)whiteAct:(id)sender {
    self.currentNormalBtnBg = [UIImage imageNamed:@"/Users/liuwyang/Downloads/Waker/white.png"];
    self.currentSelectedBtnBg = [UIImage imageNamed:@"/Users/liuwyang/Downloads/Waker/whiteselected.png"];
    [self pickColor:sender color:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0]];
}

- (IBAction)grayAct:(id)sender {
    self.currentNormalBtnBg = [UIImage imageNamed:@"/Users/liuwyang/Downloads/Waker/gray.png"];
    self.currentSelectedBtnBg = [UIImage imageNamed:@"/Users/liuwyang/Downloads/Waker/grayselected.png"];
    [self pickColor:sender color:[UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1.0]];
}
@end
