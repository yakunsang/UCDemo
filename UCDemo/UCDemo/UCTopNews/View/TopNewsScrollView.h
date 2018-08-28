//
//  TopNewsScrollView.h
//  UCDemo
//
//  Created by syk on 2018/8/22.
//  Copyright © 2018年 UCDemo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NTNHeadView.h"
typedef void(^ScrollViewContentOffSet)(CGFloat contentOffset, ScrollViewState state);
@interface TopNewsScrollView : UIScrollView

@property (nonatomic, copy) ScrollViewContentOffSet scrollContentOffset;

@end

