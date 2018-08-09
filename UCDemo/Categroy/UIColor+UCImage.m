//
//  UIColor+UCImage.m
//  UCDemo
//
//  Created by syk on 2018/8/9.
//  Copyright © 2018年 UCDemo. All rights reserved.
//

#import "UIColor+UCImage.h"

@implementation UIColor (UCImage)

+ (UIImage *)createImageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}

@end
