//
//  UITableView+SeparatorHidden.m
//  UCDemo
//
//  Created by syk on 2018/8/10.
//  Copyright © 2018年 UCDemo. All rights reserved.
//

#import "UITableView+SeparatorHidden.h"

@implementation UITableView (SeparatorHidden)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        Method originalMethod = class_getClassMethod(class, @selector(layoutSubviews));
        Method swizzledMethod = class_getClassMethod(class, @selector(uc_LayoutSubviews));
        
        BOOL didAddMedthod = class_addMethod(class, @selector(layoutSubviews), method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        if (didAddMedthod) {
            class_replaceMethod(class, @selector(uc_LayoutSubviews), class_getMethodImplementation(class, @selector(layoutSubviews)), method_getTypeEncoding(swizzledMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

- (void)uc_LayoutSubviews {
    
    
}

@end
