//
//  UIView+Frame.m
//  UCDemo
//
//  Created by syk on 2018/8/28.
//  Copyright © 2018年 UCDemo. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)
- (void)setY:(CGFloat)y {
    CGRect frame = self.bounds;
    frame.origin.y = y;
    self.bounds = frame;
}

- (CGFloat)y{
    return self.bounds.origin.y;
}

- (void)setX:(CGFloat)x {
    CGRect frame = self.bounds;
    frame.origin.x = x;
    self.bounds = frame;
}

- (CGFloat)x {
    return self.bounds.origin.x;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.bounds;
    frame.size.width = width;
    self.bounds = frame;
}

- (CGFloat)width {
    return self.bounds.size.width;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.bounds;
    frame.size.height = height;
    self.bounds = frame;
}
@end
