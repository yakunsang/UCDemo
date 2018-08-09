//
//  NewsModel.h
//  UCDemo
//
//  Created by syk on 2018/8/8.
//  Copyright © 2018年 UCDemo. All rights reserved.
//

#import <Foundation/Foundation.h>

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

+ (NSArray<NewsModel *> *)getModelFromData:(NSDictionary *)dic;

@end


