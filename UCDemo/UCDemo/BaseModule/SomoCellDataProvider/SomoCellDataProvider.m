//
//  SomoCellDataProvider.m
//  UCDemo
//
//  Created by syk on 2018/8/11.
//  Copyright © 2018年 UCDemo. All rights reserved.
//

#import "SomoCellDataProvider.h"
#import "UIView+Somo.h"
#import "SomoViewCell.h"
#import "BaseNewsCell.h"

@implementation SomoCellDataProvider
{
    NSString *_reuseIdentifier;
    SomoTableViewCellBlock _tableViewCellBlock;
    SomoTableViewCellHeightBlock _heightBlock;
}
- (instancetype)initWithCellReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super init]) {
        _reuseIdentifier = reuseIdentifier;
        _numberOfRowsInSections = 20;
    }
    return self;
}

+ (instancetype)dataSourceProviderWithCellReuseIdentifier:(NSString *)reuseIdentifier {
    return [[[self class] alloc] initWithCellReuseIdentifier:reuseIdentifier];
}

- (instancetype)initWithTableViewCellBlock:(SomoTableViewCellBlock)block heightBlock:(SomoTableViewCellHeightBlock)heightBlock {
    if (self = [super init]) {
        _tableViewCellBlock = block;
        _heightBlock = heightBlock;
        _numberOfRowsInSections = 20;
    }
    return self;
}
#pragma mark Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_reuseIdentifier) {
        return 130;
    } else {
        return _heightBlock(tableView,indexPath);
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_reuseIdentifier) {
        SomoViewCell *cell = [tableView dequeueReusableCellWithIdentifier:_reuseIdentifier];
        if (!cell) {
            cell = [[SomoViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:_reuseIdentifier];
        }
        cell.loading = YES;
        return cell;
    } else {
        return _tableViewCellBlock(tableView,indexPath);
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.numberOfRowsInSections;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    [cell beginSomo];
}
@end
