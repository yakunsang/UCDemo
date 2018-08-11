//
//  NewsModel.h
//  UCDemo
//
//  Created by syk on 2018/8/8.
//  Copyright © 2018年 UCDemo. All rights reserved.
//

#import <Foundation/Foundation.h>
#define SIZE_GAP_TOP 15
#define SIZE_GAP_LEFT 13
#define SIZE_GAP_SMALL 5
#define SIZE_GAP_BIG 10
#define SIZE_IMG 100

@interface NewsModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *uniquekey;
@property (nonatomic, copy) NSString *date;
@property (nonatomic, copy) NSString *category;
@property (nonatomic, copy) NSString *author_name;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *thumbnail_pic_s;
@property (nonatomic, copy) NSString *thumbnail_pic_s02;
@property (nonatomic, copy) NSString *thumbnail_pic_s03;

// Size
@property (nonatomic, assign) CGSize titleSize;
@property (nonatomic, assign) CGSize autherSize;
@property (nonatomic, assign) CGSize dateSize;
@property (nonatomic, assign) CGSize cellSize;

+ (NSArray<NewsModel *>*)getModelsWithDic:(NSDictionary *)dic;



@end


