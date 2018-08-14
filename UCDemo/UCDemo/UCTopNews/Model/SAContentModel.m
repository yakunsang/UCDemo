//
//  SAContentModel.m
//  UCDemo
//
//  Created by syk on 2018/8/14.
//  Copyright © 2018年 UCDemo. All rights reserved.
//

#import "SAContentModel.h"

@implementation SAContentModel

+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
    return @{@"imageurls":[ImgInfo class]};
}

+ (NSArray<SAContentModel *> *)getModelFromArray:(NSArray *)array {
    if (array.count == 0) {
        return @[];
    }
    
    NSMutableArray *mutArr = [NSMutableArray array];
    for (NSDictionary *dic in array) {
        SAContentModel *model = [SAContentModel modelWithDictionary:dic];
        [mutArr addObject:model];
        if (model.havePic) {
            if (model.imageurls.count>1) {
                CGFloat height = [NSString getHeightWithStr:model.title Width:SCREEN_WIDTH-SIZE_GAP_LEFT*2 fontSize:18];
                model.titleSize = CGSizeMake(SCREEN_WIDTH-SIZE_GAP_LEFT*2 , height);
                
                model.autherSize = [model.source sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}];
                
                model.cellSize = CGSizeMake(SCREEN_WIDTH-SIZE_GAP_LEFT*2,SIZE_GAP_TOP+height+SIZE_GAP_BIG*3+SIZE_IMG+model.autherSize.height);
            } else {
                CGFloat height = [NSString getHeightWithStr:model.title Width:SCREEN_WIDTH-SIZE_GAP_BIG-SIZE_GAP_LEFT*2 fontSize:18];
                model.titleSize = CGSizeMake(SCREEN_WIDTH-SIZE_GAP_BIG-SIZE_GAP_LEFT*2 , height);
                
                model.autherSize = [model.source sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}];
                CGFloat cellHeight = 0.0;
                if (height>SIZE_IMG) {
                    cellHeight = height + SIZE_GAP_TOP*2+model.autherSize.height;
                } else {
                    cellHeight = SIZE_GAP_TOP*2 + SIZE_IMG;
                }
                model.cellSize = CGSizeMake(SCREEN_WIDTH - SIZE_GAP_LEFT*2, cellHeight);
            }
        } else {
            CGFloat titleHeight = [NSString getHeightWithStr:model.title Width:SCREEN_WIDTH-SIZE_GAP_LEFT*2 fontSize:18];
            model.titleSize = CGSizeMake(SCREEN_WIDTH - SIZE_GAP_LEFT*2, titleHeight);
            
            CGFloat descHeight = [NSString getHeightWithStr:model.desc Width:SCREEN_WIDTH-SIZE_GAP_LEFT*2 fontSize:13];
            model.descSize = CGSizeMake(SCREEN_WIDTH-SIZE_GAP_LEFT*2, descHeight);
            
            model.autherSize = [model.source sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}];
            
            model.cellSize = CGSizeMake(SCREEN_WIDTH - SIZE_GAP_LEFT*2, titleHeight + descHeight +model.autherSize.height + SIZE_GAP_TOP*2+SIZE_GAP_SMALL*2);
        }
        
    }
    
    return mutArr.copy;
}

@end

@implementation ImgInfo

@end
