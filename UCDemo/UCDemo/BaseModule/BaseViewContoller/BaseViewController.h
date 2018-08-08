//
//  BaseViewController.h
//  UCDemo
//
//  Created by syk on 2018/8/3.
//  Copyright © 2018年 UCDemo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UITableViewController

- (void)initNavigation;

// 无数据
- (void)noDataView;
- (void)clickNoDataView;

// 无网络
- (void)noNetworkView;
- (void)clickNoNetworkView;

@end
