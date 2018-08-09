//
//  NSString+Additions.h
//  UCDemo
//
//  Created by syk on 2018/8/9.
//  Copyright © 2018年 UCDemo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Additions)

- (CGSize)sizeWithConstrainedToSize:(CGSize)size fromFont:(UIFont *)font lineSpace:(float)lineSpace;

- (CGSize)sizeWithcconstrainedToWidth:(float)width fromFont:(UIFont *)font lineSpace:(float)lineSpace;

- (void)drawInContext:(CGContextRef)context withPosition:(CGPoint)p andFont:(UIFont *)font andTextColor:(UIColor *)color andHeight:(float)height andWidth:(float)width;

- (void)drawInContext:(CGContextRef)context withPosition:(CGPoint)p andFont:(UIFont *)font andTextColor:(UIColor *)color andHeight:(float)height;

@end
