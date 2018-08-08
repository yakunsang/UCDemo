//
//  ACRequestModule.h
//  AutoCardDemo
//
//  Created by syk on 2018/8/3.
//  Copyright © 2018年 Fortune. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UCNetworkTarget : NSObject

@property (atomic,   weak) id obj;                      //处理请求回调对象
@property (atomic, assign) SEL successSelector;         // 请求成功回调
@property (atomic, assign) SEL failedSelector;          // 请求失败回调
@property (nonatomic, copy) NSString *targetIdentifier; // 请求标识

+ (instancetype)initWithTarget:(id)obj;

@end
