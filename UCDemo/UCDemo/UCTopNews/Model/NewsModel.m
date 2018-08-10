//
//  NewsModel.m
//  UCDemo
//
//  Created by syk on 2018/8/8.
//  Copyright © 2018年 UCDemo. All rights reserved.
//

#import "NewsModel.h"

@implementation NewsModel

<<<<<<< HEAD
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
=======
+ (NSArray<NewsModel *> *)getModelsWithDic:(NSDictionary *)dic {
    NSArray *data = dic[@"data"];
    if (data.count == 0) { return @[]; }
    NSMutableArray *mArray = [NSMutableArray array];
    for (NSDictionary *metDic in data) {
        NewsModel *model = [NewsModel modelWithDictionary:metDic];
        model.titleSize = [model.title sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}];
        model.autherSize = [model.author_name sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}];
        model.dateSize = [model.date sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}];
        
        [mArray addObject:model];
    }
    
    return mArray.copy;
}


>>>>>>> 62196b04de44404b1cfec32386618342f8cc2030

@end
