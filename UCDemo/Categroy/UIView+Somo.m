//
//  UIView+Somo.m
//  UCDemo
//
//  Created by syk on 2018/8/11.
//  Copyright © 2018年 UCDemo. All rights reserved.
//

#import "UIView+Somo.h"
#import "SomoView.h"
#import "SomoSkeletonLayoutProtocl.h"

static void *kSomoContainerKey = &kSomoContainerKey;
@implementation UIView (Somo)

- (void)setSomoContainer:(UIView *)somoContainer {
    UIColor *color = SomoColorFromRGBV(248.);
    if ([self respondsToSelector:@selector(somoSkeletonBackgroundColor)]) {
        color = [(UIView<SomoSkeletonLayoutProtocl> *)self somoSkeletonBackgroundColor];
    }
    
    somoContainer.backgroundColor = color;
    [self addSubview:somoContainer];
    
    objc_setAssociatedObject(self, kSomoContainerKey, somoContainer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)somoContainer {
    return objc_getAssociatedObject(self, kSomoContainerKey);
}

- (void)beginSomo {
    if (![self conformsToProtocol:@protocol(SomoSkeletonLayoutProtocl)]) {
        return;
    }
    if (![self respondsToSelector:@selector(somoSkeletonLayout)]) {
        return;
    }
    
    self.userInteractionEnabled = NO;
    
    [self buildContainer];
    
    [self bringSubviewToFront:self.somoContainer];
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
    
    NSArray <SomoView *> *somoViews = [(UIView<SomoSkeletonLayoutProtocl>*)self somoSkeletonLayout];
    [self buildSkeletonSubViews:somoViews];
}

- (void)buildContainer {
    [self clear];
    self.somoContainer = [UIView new];
}

- (void)buildSkeletonSubViews:(NSArray<SomoView*>*)views {
    for (SomoView *sv in views) {
        [self.somoContainer addSubview:sv];
    }
}

- (void)endSomo {
    [self clear];
}

- (void)clear {
    [self.somoContainer removeAllSubviews];
    self.somoContainer = nil;
}
@end
