//
//  BaseNewsCell.h
//  UCDemo
//
//  Created by syk on 2018/8/8.
//  Copyright © 2018年 UCDemo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SAContentModel;
@interface BaseNewsCell : UITableViewCell

@property (nonatomic, strong) SAContentModel *model;
@property (nonatomic, strong) UIImageView *leftImgV;
@property (nonatomic, strong) UIScrollView *contentSView;

@end
