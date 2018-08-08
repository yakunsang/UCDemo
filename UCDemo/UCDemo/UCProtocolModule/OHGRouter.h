//
//  OHGRouter.h
//  AutoCardDemo
//
//  Created by syk on 2018/8/1.
//  Copyright © 2018年 Fortune. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OHGRouter : NSObject

+ (instancetype)router;

- (id)interfaceForProtocol:(Protocol *)p;
- (id)interfaceForURL:(NSURL *)url;

// for unit test
- (void)assertForModuleWithProtocol:(Protocol *)p;
- (void)assertForModuleWithURL:(NSURL *)url;

// navi type for vc
// push present
- (UIViewController *)findVcOfView:(UIView *)view;

@end
