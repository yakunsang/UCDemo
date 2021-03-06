
//
//  UCNetworkService.m
//  UCDemo
//
//  Created by syk on 2018/8/6.
//  Copyright © 2018年 UCDemo. All rights reserved.
//

#import "UCNetworkService.h"
#import "UCNetworkTarget.h"
#import "AFNetworking.h"
// JuHeApi
static NSString  *const UCNetworkServiceLockName = @"com.ucnetworkservice.lock.name";
static NSString  *const UCURL = @"http://v.juhe.cn/toutiao/index";
static NSString  *const APPKEY = @"55e6b6a2b542d13b2f5197125b1c48fc";
// FreeApi
static NSString  *const FreeNewsURL = @"https://www.apiopen.top/journalismApi";
// ShowApi
static NSString  *const ShowAPPiD = @"72247";
static NSString  *const ShowAPPSecret = @"8bf94d7d1e814a86878ec4adc7b9a4a5";

@interface UCNetworkService()

@property (nonatomic, strong) NSMutableDictionary *cacheForDataTask;
@property (nonatomic, strong) NSLock *lock;

@end

@implementation UCNetworkService

+ (UCNetworkService *)shareInstance {
    static UCNetworkService *shareInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[UCNetworkService alloc] init];
    });
    
    return shareInstance;
}

- (instancetype)init {
    if (self = [super init]) {
        _cacheForDataTask = [NSMutableDictionary dictionary];
        _lock = [[NSLock alloc] init];
        _lock.name = UCNetworkServiceLockName;
    }
    return self;
}

-(BOOL)uc_networkReachable {
    return [[AFNetworkReachabilityManager sharedManager] isReachable];
}

- (BOOL)uc_networkReachableViaWifi {
    return [[AFNetworkReachabilityManager sharedManager] isReachableViaWiFi];
}

+ (void)uc_get:(NSString *)path params:(NSDictionary *)params target:(UCNetworkTarget *)target {
    AFHTTPSessionManager *manger = [AFHTTPSessionManager manager];
   
    NSMutableDictionary *mDic = [[NSMutableDictionary alloc] initWithDictionary:params];
    [mDic setValue:ShowAPPiD forKey:@"showapi_appid"];
    [mDic setValue:ShowAPPSecret forKey:@"showapi_sign"];
    NSURLSessionDataTask *dataTask = [manger GET:path parameters:mDic progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (target.successSelector) {
            [target.obj performSelectorOnMainThread:target.successSelector withObject:responseObject waitUntilDone:NO];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (target.failedSelector) {
            [target.obj performSelectorOnMainThread:target.failedSelector withObject:error waitUntilDone:NO];
        }
    }];
    
    [[UCNetworkService shareInstance].lock lock];
    [[UCNetworkService shareInstance].cacheForDataTask setObject:dataTask forKey:target.targetIdentifier];
    [[UCNetworkService shareInstance].lock unlock];
}

+ (void)uc_post:(NSString *)path params:(NSDictionary *)params target:(UCNetworkTarget *)target {
    AFHTTPSessionManager *manger = [AFHTTPSessionManager manager];
    
    NSMutableDictionary *mDic = [[NSMutableDictionary alloc] initWithDictionary:params];
    [mDic setValue:ShowAPPiD forKey:@"showapi_appid"];
    [mDic setValue:ShowAPPSecret forKey:@"showapi_sign"];
    NSURLSessionDataTask *dataTask = [manger POST:path parameters:mDic progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (target.successSelector) {
            [target.obj performSelectorOnMainThread:target.successSelector withObject:responseObject waitUntilDone:NO];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (target.failedSelector) {
            [target.obj performSelectorOnMainThread:target.failedSelector withObject:error waitUntilDone:NO];
        }
    }];
    
    [[UCNetworkService shareInstance].lock lock];
    [[UCNetworkService shareInstance].cacheForDataTask setObject:dataTask forKey:target.targetIdentifier];
    [[UCNetworkService shareInstance].lock unlock];
}

+ (void)uc_cancelRequestWithTarget:(id)target {
    [[UCNetworkService shareInstance].lock lock];
    UCNetworkTarget *ucTarget = (UCNetworkTarget *)target;
    NSURLSessionDataTask *dataTask = [[UCNetworkService shareInstance].cacheForDataTask objectForKey:ucTarget.targetIdentifier];
    [dataTask cancel];
    [[UCNetworkService shareInstance].lock unlock];
}

+ (void)uc_cancelAllRequest {
    [[AFHTTPSessionManager manager].dataTasks makeObjectsPerformSelector:@selector(cancel)];
}

@end
