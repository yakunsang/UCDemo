//
//  RecommondNews.m
//  UCDemo
//
//  Created by syk on 2018/8/8.
//  Copyright © 2018年 UCDemo. All rights reserved.
//

#import "RecommondNews.h"
<<<<<<< HEAD
#import "NewsLeftImgCell.h"
=======
#import "BaseNewsCell.h"
#import "NewsLeftImgCell.h"
#import "NewsDefaultCell.h"
static NSString *cellIdentifier = @"BaseNewsCell";
static NSString *cellLeftIdentifier = @"CellLeftImage";
>>>>>>> 62196b04de44404b1cfec32386618342f8cc2030

@interface RecommondNews ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation RecommondNews

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        self.delegate = self;
        self.dataSource = self;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
<<<<<<< HEAD
        self.separatorInset = UIEdgeInsetsZero;
        self.separatorColor = [UIColor clearColor];
=======
>>>>>>> 62196b04de44404b1cfec32386618342f8cc2030
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

#pragma mark tableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
<<<<<<< HEAD
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"NewsLeftImgCell";
    NewsLeftImgCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[NewsLeftImgCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.separatorInset = UIEdgeInsetsZero;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.separatorInset = UIEdgeInsetsMake(0.f, cell.bounds.size.width, 0.f, 0.f);
    cell.model = self.dataArray[indexPath.row];
=======
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
>>>>>>> 62196b04de44404b1cfec32386618342f8cc2030
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
<<<<<<< HEAD
    return 200;
}


=======
    return 130;
}

>>>>>>> 62196b04de44404b1cfec32386618342f8cc2030
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
