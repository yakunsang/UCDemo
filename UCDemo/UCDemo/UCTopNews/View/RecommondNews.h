//
//  RecommondNews.h
//  UCDemo
//
//  Created by syk on 2018/8/8.
//  Copyright © 2018年 UCDemo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SAContentModel;
@interface RecommondNews : UITableView

@property (nonatomic, strong) NSMutableArray<SAContentModel *> *dataArray;
@property (nonatomic, weak) UIViewController *vc;
@end
