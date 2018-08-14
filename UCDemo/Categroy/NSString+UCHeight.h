//
//  NSString+UCHeight.h
//  UCDemo
//
//  Created by syk on 2018/8/14.
//  Copyright © 2018年 UCDemo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (UCHeight)

+ (CGFloat)getHeightWithStr:(NSString *)str
                      Width:(CGFloat)width
                   fontSize:(float)fontSize;

@end
