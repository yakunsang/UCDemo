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
#import "FreeNewsModel.h"
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
        self.delegate = _somoDataProvider;
        self.dataSource = _somoDataProvider;
    }
    return self;
}

- (void)initSomoDataProvider {
    _somoDataProvider = [[SomoCellDataProvider alloc] initWithCellReuseIdentifier:cellLeftIdentifier];
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

#pragma mark tableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count?self.dataArray.count:10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    FreeNewsModel *model = self.dataArray[indexPath.row];
    if (model.cellSize.height!=0) {
        return model.cellSize.height;
    }
    return 150;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"NewsLeftImgCell";
    NewsLeftImgCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[NewsLeftImgCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    if (self.dataArray.count>0) {
        cell.model = self.dataArray[indexPath.row];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row>self.dataArray.count) {
        return;
    }
    FreeNewsModel *model = self.dataArray[indexPath.row];

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
