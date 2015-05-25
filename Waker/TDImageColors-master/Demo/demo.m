//
//  33DEMO.m
//  TDImageColors
//
//  Created by 张翎影 on 14/11/1.
//  Copyright (c) 2014年 timominous. All rights reserved.
//

#import "demo.h"
#import "TDDemoViewController.h"
@implementation demo

-(void)getColors{
    
    TDDemoViewController * colorDemo = [[TDDemoViewController alloc]init];
    
    
    NSString *imageName = [NSString stringWithFormat:@"test_image1.jpg",arc4random_uniform(6)];
    UIImage *image = [UIImage imageNamed:imageName];
   
    UIColor * maxcolor = [colorDemo getImageColors:image];
    
    CGFloat h,s,b,a;
    CGFloat diff=0;
    CGFloat diffmin=360*360;
    [maxcolor getHue:&h saturation:&s brightness:&b alpha:&a];
    NSArray * colors= @[
                        [UIColor redColor],
                        [UIColor blueColor],
                        [UIColor greenColor],
                        [UIColor yellowColor],
                        [UIColor colorWithRed:0.8 green:0.0 blue:0.0 alpha:1.0],//black
                        [UIColor purpleColor],
                        [UIColor orangeColor],
                        [UIColor brownColor],
                        [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1.0],//gray
                        [UIColor magentaColor],
                        [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0],//white
                        [UIColor cyanColor]
                        ];
    
    for(UIColor * color in colors){
        CGFloat hue, saturation;
        diff=(hue-h)*(hue-h);
        if (diff<diffmin) diffmin=diff;
        maxcolor=color;
    }

    NSLog(@"--------@%-----",maxcolor);
    
}

@end
