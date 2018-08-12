//
//  RecommondNews.h
//  UCDemo
//
//  Created by syk on 2018/8/8.
//  Copyright © 2018年 UCDemo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FreeNewsModel;
@interface RecommondNews : UITableView

@property (nonatomic, strong) NSMutableArray<FreeNewsModel *> *dataArray;
@property (nonatomic, weak) UIViewController *vc;
@end
