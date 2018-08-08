//
//  UCNetworkService.h
//  UCDemo
//
//  Created by syk on 2018/8/6.
//  Copyright © 2018年 UCDemo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UCNetworkTarget;
@interface UCNetworkService : NSObject

@property (nonatomic, copy) NSString *baseURL;

+ (UCNetworkService *)shareInstance;

// 是否有网络
- (BOOL)uc_networkReachable;

// 当前网络状态是否是WiFi
- (BOOL)uc_networkReachableViaWifi;

// 发起get/post网络请求
+ (void)uc_get:(NSString *)path params:(NSDictionary *)params target:(UCNetworkTarget *)target;
+ (void)uc_post:(NSString *)path params:(NSDictionary *)params target:(UCNetworkTarget *)target;

// 取消一个请求
+ (void)uc_cancelRequestWithTarget:(id)target;


// 取消所有请求
+ (void)uc_cancelAllRequest;
    
@end
