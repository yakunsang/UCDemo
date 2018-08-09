//
//  RecommondNews.m
//  UCDemo
//
//  Created by syk on 2018/8/8.
//  Copyright © 2018年 UCDemo. All rights reserved.
//

#import "RecommondNews.h"
#import "BaseNewsCell.h"
#import "NewsLeftImgCell.h"
#import "NewsDefaultCell.h"
static NSString *cellIdentifier = @"BaseNewsCell";
static NSString *cellLeftIdentifier = @"CellLeftImage";

@interface RecommondNews ()<UITableViewDelegate,UITableViewDataSource,UITableViewDataSourcePrefetching>


@end

@implementation RecommondNews

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        self.delegate = self;
        self.dataSource = self;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    
    return self;
}

#pragma mark tableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count>0?self.dataArray.count:10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.dataArray.count == 0) {
        NewsDefaultCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell) {
            cell = [[NewsDefaultCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        
        return cell;
    }
    
    NewsLeftImgCell *cell = [tableView dequeueReusableCellWithIdentifier:cellLeftIdentifier];
    if (!cell) {
        cell = [[NewsLeftImgCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellLeftIdentifier];
    } 
    cell.model = self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView prefetchRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths {
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 130;
}

- (void)setDataArray:(NSMutableArray *)dataArray {
    _dataArray = dataArray;
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
