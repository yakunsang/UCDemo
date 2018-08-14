
//
//  SAChannelModel.m
//  UCDemo
//
//  Created by syk on 2018/8/14.
//  Copyright © 2018年 UCDemo. All rights reserved.
//

#import "SAChannelModel.h"

@implementation SAChannelModel

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.channelId = [aDecoder decodeObjectForKey:channelId];
        self.name = [aDecoder decodeObjectForKey:name];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.channelId forKey:channelId];
    [aCoder encodeObject:self.name forKey:name];
}

- (id)copyWithZone:(NSZone *)zone {
    SAChannelModel *copyModel = [self.class allocWithZone:zone];
    copyModel.channelId = [self.channelId copyWithZone:zone];
    copyModel.name = [self.channelId copyWithZone:zone];
    
    return copyModel;
}

+ (NSArray<SAChannelModel *> *)getChannelModelsFromDic:(NSDictionary *)dic {
    if (!dic) {
        return @[];
    }
    NSArray *channelArray = dic[@"channelList"];
    if (!channelArray) {
        return @[];
    }
    
    NSMutableArray *mutArr = [NSMutableArray array];
    for (NSDictionary *mdic in channelArray) {
        SAChannelModel *model = [SAChannelModel modelWithDictionary:mdic];
        [mutArr addObject:model];
    }
    NSData *writeData = [NSKeyedArchiver archivedDataWithRootObject:mutArr];
    [[NSUserDefaults standardUserDefaults] setObject:writeData forKey:ChannelIdArray];
    [[NSUserDefaults standardUserDefaults] synchronize];
    return mutArr.copy;
}

@end
