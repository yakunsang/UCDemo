//
//  NSString+UCHeight.m
//  UCDemo
//
//  Created by syk on 2018/8/14.
//  Copyright © 2018年 UCDemo. All rights reserved.
//

#import "NSString+UCHeight.h"
#import <UIKit/UIKit.h>

@implementation NSString (UCHeight)

+ (CGFloat)getHeightWithStr:(NSString *)str
                      Width:(CGFloat)width
                   fontSize:(float)fontSize {

    if (width <= 0) return 0;
    if (fontSize <= 0) return 0;
    
    static UILabel *lab;
    lab = [[UILabel alloc] init];
    lab.text = str;
    lab.font = [UIFont systemFontOfSize:fontSize];
    lab.numberOfLines = 0;
    
    CGRect rect = [lab textRectForBounds:CGRectMake(0, 0, width, 1000) limitedToNumberOfLines:1000];
    
    return rect.size.height;
}

@end
