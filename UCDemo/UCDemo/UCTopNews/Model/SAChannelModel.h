//
//  SAChannelModel.h
//  UCDemo
//
//  Created by syk on 2018/8/14.
//  Copyright © 2018年 UCDemo. All rights reserved.
//

#import <Foundation/Foundation.h>

static  NSString * const channelId = @"channelId";
static  NSString * const name = @"name";

@interface SAChannelModel : NSObject<NSCopying,NSCoding>
@property (nonatomic, copy) NSString *channelId;
@property (nonatomic, copy) NSString *name;

+ (NSArray<SAChannelModel *> *)getChannelModelsFromDic:(NSDictionary *)dic;

@end
