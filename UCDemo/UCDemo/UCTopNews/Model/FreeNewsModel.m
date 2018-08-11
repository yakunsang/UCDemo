//
//  FreeNewsModel.m
//  UCDemo
//
//  Created by syk on 2018/8/11.
//  Copyright © 2018年 UCDemo. All rights reserved.
//

#import "FreeNewsModel.h"

@implementation FreeNewsModel

+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
    return @{@"picInfo":[PicInfo class]};
}

+(NSArray<FreeNewsModel *> *)getModelsfromArray:(NSArray *)data {
    if (!data) { return @[]; }
   
    NSMutableArray *array = [NSMutableArray array];
    for (NSDictionary *modelDic in data) {
        FreeNewsModel *model = [FreeNewsModel modelWithDictionary:modelDic];
        model.titleSize = [model.title sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18]}];
        model.autherSize = [model.source sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}];
        model.dateSize = [model.ptime sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}];
        
        if (model.titleSize.height < SIZE_IMG) {
            model.cellSize = CGSizeMake(SCREEN_WIDTH, SIZE_GAP_TOP + SIZE_IMG + SIZE_GAP_BIG);
        } else {
            model.cellSize = CGSizeMake(SCREEN_WIDTH, SIZE_GAP_TOP + model.titleSize.height + SIZE_GAP_BIG);
        }
        [array addObject:model];
    }
    
    return array.copy;
}

@end

@implementation PicInfo

@end
