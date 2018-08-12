//
//  SomoCellDataProvider.h
//  UCDemo
//
//  Created by syk on 2018/8/11.
//  Copyright © 2018年 UCDemo. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol SomoSkeletonLayoutProtocol;

typedef UITableViewCell<SomoSkeletonLayoutProtocol> *(^SomoTableViewCellBlock)(UITableView *tableView, NSIndexPath *indexPath);
typedef CGFloat (^SomoTableViewCellHeightBlock)(UITableView *tableView,NSIndexPath *indexPath);

@interface SomoCellDataProvider : NSObject<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, assign) NSInteger numberOfRowsInSections;

/**
 单一cell样式

 @param reuseIdentifier 标识符
 @return self
 */
- (instancetype)initWithCellReuseIdentifier:(NSString *)reuseIdentifier;
+ (instancetype)dataSourceProviderWithCellReuseIdentifier:(NSString *)reuseIdentifier;


/**
 多种样式

 @param block 返回多种cell<SomoSkeletonLayoutProtocol>
 @param heightBlock cell高度
 @return self
 */
- (instancetype)initWithTableViewCellBlock:(SomoTableViewCellBlock)block
                               heightBlock:(SomoTableViewCellHeightBlock)heightBlock;
@end
