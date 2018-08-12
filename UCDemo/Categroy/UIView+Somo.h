//
//  UIView+Somo.h
//  UCDemo
//
//  Created by syk on 2018/8/11.
//  Copyright © 2018年 UCDemo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Somo)

@property (nonatomic, strong, readonly) UIView *somoContainer;

/**
 开始动效
 */
- (void)beginSomo;

/**
 结束动效
 */
- (void)endSomo;

@end
