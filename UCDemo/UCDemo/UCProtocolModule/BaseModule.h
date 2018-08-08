//
//  BaseModule.h
//  AutoCardDemo
//
//  Created by syk on 2018/8/1.
//  Copyright © 2018年 Fortune. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#ifndef ModuleProtocol_ServerInterface
#define ModuleProtocol_ServerInterface @"SI"
#endif

@protocol BaseModule <NSObject>

@required
// server body
@property(nonatomic, strong) __kindof UIViewController *serverBody;

@optional
// callback
@property(nonatomic, copy) void (^callback) (id params);

@end


@protocol ModuleA <BaseModule>

@required
// input 作为组件A的入参 可以自定义任意属性
@property(nonatomic, strong) NSString *name;

@end
