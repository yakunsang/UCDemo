//
//  FreeNewsModel.h
//  UCDemo
//
//  Created by syk on 2018/8/11.
//  Copyright © 2018年 UCDemo. All rights reserved.
//

#import <Foundation/Foundation.h>

#define SIZE_GAP_TOP 15
#define SIZE_GAP_LEFT 13
#define SIZE_GAP_SMALL 5
#define SIZE_GAP_BIG 10
#define SIZE_IMG 100

@class PicInfo;
@interface FreeNewsModel : NSObject

@property (nonatomic, copy) NSString *liveInfo;
@property (nonatomic, copy) NSString *tcount;
@property (nonatomic, copy) NSString *docid;
@property (nonatomic, copy) NSString *videoInfo;
@property (nonatomic, copy) NSString *channel;
@property (nonatomic, copy) NSString *link;
@property (nonatomic, copy) NSString *source;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *imgsrcFrom;
@property (nonatomic, copy) NSString *imgsrc3gtype;
@property (nonatomic, copy) NSString *unlikeReason;
@property (nonatomic, copy) NSString *digest;
@property (nonatomic, copy) NSString *typeid;
@property (nonatomic, copy) NSString *addata;
@property (nonatomic, copy) NSString *tag;
@property (nonatomic, copy) NSString *category;
@property (nonatomic, copy) NSString *ptime;
@property (nonatomic, copy) NSArray *picInfo;

// Size
@property (nonatomic, assign) CGSize titleSize;
@property (nonatomic, assign) CGSize autherSize;
@property (nonatomic, assign) CGSize dateSize;
@property (nonatomic, assign) CGSize cellSize;

+ (NSArray <FreeNewsModel *> *)getModelsfromArray:(NSArray *)data;

@end

@interface PicInfo : NSObject

@property (nonatomic, copy) NSString *ref;
@property (nonatomic, copy) NSString *width;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *height;

@end
