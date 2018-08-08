//
//  ACRequestModule.m
//  AutoCardDemo
//
//  Created by syk on 2018/8/3.
//  Copyright © 2018年 Fortune. All rights reserved.
//

#import "UCNetworkTarget.h"

@implementation UCNetworkTarget  

+ (UCNetworkTarget *)initWithTarget:(id)obj {
    UCNetworkTarget *target = [[UCNetworkTarget alloc] init];
    target.obj = obj;
    
    return target;
}

- (NSString *)targetIdentifier {
    NSTimeInterval nowInterval = [[NSDate date] timeIntervalSince1970]*1000;
    
    return [NSString stringWithFormat:@"%f",nowInterval];
}
@end
