//
//  NewsModel.m
//  UCDemo
//
//  Created by syk on 2018/8/8.
//  Copyright © 2018年 UCDemo. All rights reserved.
//

#import "NewsModel.h"

@implementation NewsModel

+ (NSArray<NewsModel *> *)getModelFromData:(NSDictionary *)dic {
    NSArray *dataSource = [dic objectForKey:@"data"];
    if (dataSource.count == 0) { return @[]; }
    
    NSMutableArray *array = [NSMutableArray array];
    for (NSDictionary *dic in dataSource) {
        NewsModel *model = [NewsModel modelWithDictionary:dic];
        [array addObject:model];
    }
    
    
    return array.copy;
}

@end
