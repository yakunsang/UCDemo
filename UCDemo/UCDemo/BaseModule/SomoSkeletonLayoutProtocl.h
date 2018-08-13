//
//  SomoSkeletonLayoutProtocl.h
//  UCDemo
//
//  Created by syk on 2018/8/11.
//  Copyright © 2018年 UCDemo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SomoView;
@protocol SomoSkeletonLayoutProtocl <NSObject>

/**
     SomoView * s0 = [[SomoView alloc] initWithFrame:CGRectMake(10, 20, 70, 70)];
     SomoView * s1 = [[SomoView alloc] initWithFrame:CGRectMake(100, 30, 200, 15)];
     SomoView * s2 = [[SomoView alloc] initWithFrame:CGRectMake(100, 70, 100, 15)];
 
     return @[s0,s1,s2];
 @return array of SomoViews
 */
- (NSArray <SomoView *>*)somoSkeletonLayout;

/**
     SomoView's BackgroundColor

 @return SomoView's BackgroundColor
 */
- (UIColor *)somoSkeletonBackgroundColor;

@end
