//
//  RecommondNews.m
//  UCDemo
//
//  Created by syk on 2018/8/8.
//  Copyright © 2018年 UCDemo. All rights reserved.
//

#import "RecommondNews.h"
#import "NewsLeftImgCell.h"
#import "BaseNewsCell.h"
#import "NewsLeftImgCell.h"
#import "NewsDefaultCell.h"
#import "NewsBottomThreeImgCell.h"
#import "SAContentModel.h"
#import "SomoCellDataProvider.h"


static NSString *cellIdentifier = @"BaseNewsCell";
static NSString *cellLeftIdentifier = @"CellLeftImage";

@interface RecommondNews ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) SomoCellDataProvider *somoDataProvider;

@end

@implementation RecommondNews

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.separatorInset = UIEdgeInsetsZero;
        self.separatorColor = [UIColor clearColor];
        
        [self initSomoDataProvider];
        
        if (@available(iOS 11.0,*)) {
            self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            self.contentInset = UIEdgeInsetsZero;
        }
    }
    return self;
}

- (void)initSomoDataProvider {
    _somoDataProvider = [[SomoCellDataProvider alloc] initWithCellReuseIdentifier:cellLeftIdentifier];
    self.delegate = _somoDataProvider;
    self.dataSource = _somoDataProvider;
}

#pragma mark tableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    SAContentModel *model = self.dataArray[indexPath.row];
    if (model.cellSize.height!=0) {
        return model.cellSize.height;
    }
    return 150;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SAContentModel *model = self.dataArray[indexPath.row];
    Class class = nil;
    if (model.havePic) {
        if (model.imageurls.count>1) {
            class = [NewsBottomThreeImgCell class];
        } else {
            class = [NewsLeftImgCell class];
        }
    } else {
        class = [NewsDefaultCell class];
    }
    BaseNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(class)];
    
    if (cell == nil) {
        cell = [[class alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass(class)];
    }
    
    if ([cell respondsToSelector:@selector(setModel:)]) {
        cell.model = model;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row>self.dataArray.count) {
        return;
    }
    SAContentModel *model = self.dataArray[indexPath.row];

    id<NewsDetailModule> obj = [[OHGRouter router] interfaceForProtocol:@protocol(NewsDetailModule)];
    obj.url = model.link;
    [self.vc.navigationController pushViewController:obj.serverBody animated:YES];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)tableView:(UITableView *)tableView prefetchRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths {
    
}

- (void)setDataArray:(NSMutableArray *)dataArray {
    _dataArray = dataArray;
    self.delegate = self;
    self.dataSource = self;
    [self reloadData];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
