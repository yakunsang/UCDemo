//
//  TopNewsScrollView.m
//  UCDemo
//
//  Created by syk on 2018/8/22.
//  Copyright © 2018年 UCDemo. All rights reserved.
//

#import "TopNewsScrollView.h"
#import "RecommondNews.h"
#import "NTNHeadView.h"
#import "BrowseHeadView.h"

@interface TopNewsScrollView() <UIScrollViewDelegate>

@property (nonatomic, strong) RecommondNews *rcdTableView;
@property (nonatomic, strong) NTNHeadView *norHeadView;
@property (nonatomic, strong) BrowseHeadView *brseHeadView;

@end

@implementation TopNewsScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.delegate = self;
        self.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_WIDTH);
        self.bounces = YES;
        _norHeadView = [[NTNHeadView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 300)];
        _rcdTableView = [[RecommondNews alloc] initWithFrame:CGRectMake(0, 300, SCREEN_WIDTH, SCREEN_HEIGHT - 300) style:UITableViewStylePlain];
        
        [self addSubview:_norHeadView];
        [self addSubview:_rcdTableView];
        
    }
    return self;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"%f",scrollView.contentOffset.y);
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
