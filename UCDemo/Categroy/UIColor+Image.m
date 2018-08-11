//
//  UIColor+Image.m
//  UCDemo
//
//  Created by syk on 2018/8/9.
//  Copyright © 2018年 UCDemo. All rights reserved.
//

#import "UIColor+Image.h"

@implementation UIColor (Image)
+ (UIImage *)createImageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context1 = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context1, [color CGColor]);
    CGContextFillRect(context1, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}
@end
