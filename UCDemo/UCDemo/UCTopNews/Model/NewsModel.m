//
//  NewsModel.m
//  UCDemo
//
//  Created by syk on 2018/8/8.
//  Copyright © 2018年 UCDemo. All rights reserved.
//

#import "NewsModel.h"

@implementation NewsModel

+ (NSArray<NewsModel *> *)getModelsWithDic:(NSDictionary *)dic {
    NSArray *data = dic[@"data"];
    if (data.count == 0) { return @[]; }
    NSMutableArray *mArray = [NSMutableArray array];
    for (NSDictionary *metDic in data) {
        NewsModel *model = [NewsModel modelWithDictionary:metDic];
        model.titleSize = [model.title sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18]}];
        model.autherSize = [model.author_name sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}];
        model.dateSize = [model.date sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}];
        
        if (model.titleSize.height < SIZE_IMG) {
            model.cellSize = CGSizeMake(SCREEN_WIDTH, SIZE_GAP_TOP + SIZE_IMG + SIZE_GAP_BIG);
        } else {
            model.cellSize = CGSizeMake(SCREEN_WIDTH, SIZE_GAP_TOP + model.titleSize.height + SIZE_GAP_BIG);
        }
        [mArray addObject:model];
    }
    NSLog(@"%@",[NSThread currentThread]);
    return mArray.copy;
}



@end
