//
//  SAContentModel.h
//  UCDemo
//
//  Created by syk on 2018/8/14.
//  Copyright © 2018年 UCDemo. All rights reserved.
//

#import <Foundation/Foundation.h>

#define SIZE_GAP_TOP 15
#define SIZE_GAP_LEFT 13
#define SIZE_GAP_SMALL 5
#define SIZE_GAP_BIG 10
#define SIZE_IMG 100
#define SIZE_IMG_WIDTH (SCREEN_WIDTH-SIZE_GAP_LEFT*2-3)/3

@class ImgInfo;
@interface SAContentModel : NSObject

@property (nonatomic, copy) NSString *channelId;
@property (nonatomic, copy) NSString *chanelName;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, assign) BOOL havePic;
@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSArray<ImgInfo *> *imageurls;
@property (nonatomic, copy) NSString *link;
@property (nonatomic, copy) NSString *pubDate;
@property (nonatomic, copy) NSString *source;
@property (nonatomic, copy) NSString *title;


// Size
@property (nonatomic, assign) CGSize titleSize;
@property (nonatomic, assign) CGSize descSize;
@property (nonatomic, assign) CGSize autherSize;
@property (nonatomic, assign) CGSize dateSize;
@property (nonatomic, assign) CGSize cellSize;

+ (NSArray<SAContentModel *> *)getModelFromArray:(NSArray *)array;

@end

@interface ImgInfo : NSObject

@property (nonatomic, copy) NSString *url;
@property (nonatomic, assign) float height;
@property (nonatomic, assign) float width;

@end
