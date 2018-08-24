//
//  NTNHeadView.h
//  UCDemo
//
//  Created by syk on 2018/8/22.
//  Copyright © 2018年 UCDemo. All rights reserved.
//

#import <UIKit/UIKit.h>

static const CGFloat vHeight = 300.0;

typedef NS_ENUM(NSInteger,ScrollViewState) {
    ScrollViewUpState, // 向上
    ScrollViewDownState // 向下
};

@interface NTNHeadView : UIView // 首次进入状态

@property (nonatomic, assign) ScrollViewState scrollViewState;
@property (nonatomic, assign) CGFloat offSetY;

@end
