//
//  DemoTableViewController.m
//  HFColorPickerDemo
//
//  Created by Hendrik Frahmann on 30.04.14.
//  Copyright (c) 2014 Hendrik Frahmann. All rights reserved.
//

#import "ColorPickingViewController.h"

@interface ColorPickingViewController()

- (NSString*)hexCodeFromColor:(UIColor*)color;

@end


@implementation ColorPickingViewController
@synthesize colorChosen;
@synthesize colorInText;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _colorPickerView.colors = @[
                                [UIColor redColor],
                                [UIColor blueColor],
                                [UIColor greenColor],
                                [UIColor yellowColor],
                                [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0],//black
                                [UIColor purpleColor],
                                [UIColor orangeColor],
                                [UIColor brownColor],
                                [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1.0],//gray
                                [UIColor magentaColor],
                                [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0],//white
                                [UIColor cyanColor]
                                ];
    
}


#pragma mark - HFColorPickerViewControllerDelegate

- (void)colorPicker:(HFColorPickerView *)colorPickerView selectedColor:(UIColor *)selectedColor
{
    self.colorChosen=selectedColor;
    self.colorInText = [self hexCodeFromColor:selectedColor];
    
    CGFloat r,b,g;
    [self.colorChosen getRed:&r green:&g blue:&b alpha:nil];
    NSLog(@"[ColorPickingViewController] Color picked:  red:%f blue:%f green:%f  Color is : %@",r,b,g,self.colorInText);

    _labelColor.textColor = selectedColor;
    _labelColor.text = [self hexCodeFromColor:selectedColor];


}
#pragma mark - Private

- (NSString*)hexCodeFromColor:(UIColor *)color
{
    CGFloat red = 0.0, green = 0.0, blue = 0.0, alpha = 0.0;
    [color getRed:&red green:&green blue:&blue alpha:&alpha];
    
    return [NSString stringWithFormat:@"#%02X%02X%02X", (int)(red * 255.0f), (int)(green * 255.0f), (int)(blue * 255.0f)];
}




@end
