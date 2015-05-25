//
//  TDDemoViewController.m
//  TDImageColors
//
//  Created by timominous on 11/22/13.
//  Copyright (c) 2013 timominous. All rights reserved.
//

#import "TDDemoViewController.h"
#import "TDImageColors.h"

@interface TDDemoViewController ()

@end

@implementation TDDemoViewController
@synthesize result;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Custom initialization
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
//  dispatch_group_t group = dispatch_group_create();
//  
//  dispatch_group_enter(group);
// // NSString *imageName = [NSString stringWithFormat:@"test_image0.jpg", arc4random_uniform(6)];
//    NSString *imageName =@"test_image0.jpg";
//  UIImage *image = [UIImage imageNamed:imageName];
//  self.imageView.image = image;
//  TDImageColors *imageColors = [[TDImageColors alloc] initWithImage:image count:5];
//  dispatch_group_leave(group);
//
//  dispatch_group_notify(group, dispatch_get_main_queue(), ^{
//      UIColor * temp;
//for (UIColor *color in imageColors.colors) {
//      NSUInteger idx = [imageColors.colors indexOfObject:color];
//        
//        CGFloat h,s,b,a;
//        CGFloat diff=0;
//        CGFloat diffmin=1;
//        [color getHue:&h saturation:&s brightness:&b alpha:&a];
//        NSArray * colors= @[
//                            [UIColor redColor],
//                            [UIColor blueColor],
//                            [UIColor greenColor],
//                            [UIColor yellowColor],
//                            [UIColor colorWithRed:0.8 green:0.0 blue:0.0 alpha:1.0],//black
//                            [UIColor purpleColor],
//                            [UIColor orangeColor],
//                            [UIColor brownColor],
//                            [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1.0],//gray
//                            [UIColor magentaColor],
//                            [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0],//white
//                            [UIColor cyanColor]
//                            ];
//        
//        for(UIColor * maxcolor in colors)
//        {
//            CGFloat hue, saturation,brightness,alpha;
//            [maxcolor getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha];
//            NSLog(@"hue------%f",hue);
//            diff=(hue-h)*(hue-h);
//            if (diff<diffmin)
//            {
//                diffmin=diff;
//                temp=maxcolor;
//            }
//        }
//    
//        //
//        
//
//      [_colorViews[idx] setBackgroundColor:temp];
//          
//    }
//  });
//    
//      dispatch_group_t group = dispatch_group_create();
//    
//      dispatch_group_enter(group);
//    UIImage *image = [UIImage imageNamed:@"test_image0.jpg"];
//      self.imageView.image = image;
//      TDImageColors *imageColors = [[TDImageColors alloc] initWithImage:image count:5];
//      dispatch_group_leave(group);
//    
//      dispatch_group_notify(group, dispatch_get_main_queue(), ^{
//        for (UIColor *color in imageColors.colors) {
//          NSUInteger idx = [imageColors.colors indexOfObject:color];
//          [_colorViews[idx] setBackgroundColor:color];
//        }
//      });
}

-(UIColor*)getImageColors:(UIImage *)image{
//    //--test
////        NSString *imageName =@"test_image0.jpg";
////      UIImage *image1 = [UIImage imageNamed:imageName];
      self.imageView.image = image;
//
// 
//    //----
   

//    dispatch_group_t group1 = dispatch_group_create();
//    dispatch_group_enter(group1);
    TDImageColors *imageColors = [[TDImageColors alloc] initWithImage:image count:1];
//    dispatch_group_leave(group1);
    
//    dispatch_group_notify(group1, dispatch_get_main_queue(), ^{
        for (UIColor *color in imageColors.colors) {
            NSUInteger idx = [imageColors.colors indexOfObject:color];
          
            CGFloat h,s,b,a;
            CGFloat diff=0;
            CGFloat diffmin=1;
            [color getHue:&h saturation:&s brightness:&b alpha:&a];
            NSArray * colors= @[
                                [UIColor redColor],
                                [UIColor orangeColor],
                                [UIColor yellowColor],
                                [UIColor colorWithRed:0.5 green:1.0 blue:0.0 alpha:1.0], //grassgreen
                                [UIColor greenColor],
                                [UIColor colorWithRed:0.0 green:1.0 blue:0.5 alpha:1.0], //emerald
                                [UIColor cyanColor],
                                [UIColor colorWithRed:0.0 green:0.5 blue:1.0 alpha:1.0], //skyblue
                                [UIColor blueColor],
                                [UIColor colorWithRed:0.5 green:0.0 blue:1.0 alpha:1.0], //violet
                                [UIColor magentaColor],
                                [UIColor colorWithRed:1.0 green:0.0 blue:0.5 alpha:1.0] //rosered
                                ];
            
            for(UIColor * maxcolor in colors)
            {
                CGFloat hue, saturation,brightness,alpha,tmp;
                [maxcolor getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha];
                CGFloat red, green,blue;

                [maxcolor getRed:&red green:&green blue:&blue alpha:&alpha];
                //NSLog(@"hue------%f,red------%f,green------%f,blue------%f",hue,red,green,blue);
                diff=(hue-h)*(hue-h);
                
                
                if (diff<diffmin)
                {
                    diffmin=diff;
                    
                    result=maxcolor;
                    [result getHue:&tmp saturation:nil brightness:nil alpha:nil];
                    NSLog(@"hue------%f ,red------%f,green------%f,blue------%f",tmp,red,green,blue);
                
                }
            }
            
           [_colorViews[idx] setBackgroundColor:color]; //设置提取出来的view颜色
            
//              NSLog(@"~~~~~~~~~~~~~~~~~idx : %lu", (unsigned long)idx);
            
        }
//        self.result = temp;
//        [self.view setBackgroundColor:result]; //设置提取出来的view颜色

//    });
    
    
    return result;
   // return nil;
}
-(IBAction)backToSuperView:(id)sender{
    [self.view removeFromSuperview];
}

@end
