//
//  OHGRouter.m
//  AutoCardDemo
//
//  Created by syk on 2018/8/1.
//  Copyright © 2018年 Fortune. All rights reserved.
//

#import "OHGRouter.h"

@implementation OHGRouter

+ (instancetype)router {
    static OHGRouter *router = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!router) {
            router = [[OHGRouter alloc] init];
        }
    });
    
    return router;
}

- (id)interfaceForProtocol:(Protocol *)p {
    Class cls = [self _clsForProtocol:p];
    
    return [[cls alloc] init];
}

- (Class)_clsForProtocol:(Protocol *)p {
    NSString *clsString = [NSStringFromProtocol(p) stringByAppendingString:ModuleProtocol_ServerInterface];
    
    return NSClassFromString(clsString);
}

- (id)interfaceForURL:(NSURL *)url {
    
    return nil;
}

- (void)assertForModuleWithProtocol:(Protocol *)p {
    if (![self _clsForProtocol:p]) {
//        NSString *protocolName = NSStringFromProtocol(p);
//        NSString *clsName = [protocolName stringByAppendingString: ModuleProtocol_ServerInterface];
//        NSString *reason = [NSString stringWithFormat:@"找不到协议 %@ 对应的接口类 %@ 的实现",protocolName,clsName];
//        NSLog(@"%@",reason);
    }
}

- (void)assertForModuleWithURL:(NSURL *)url {
    
}

- (UIViewController *)findVcOfView:(UIView *)view {
    
    return nil;
}
@end
