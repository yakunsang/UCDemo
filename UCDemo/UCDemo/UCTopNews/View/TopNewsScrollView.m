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

@interface TopNewsScrollView() <UIScrollViewDelegate,UIGestureRecognizerDelegate>

{
    CGFloat _lastY;
    BOOL _decelerate;
}
@property (nonatomic, strong) NTNHeadView *norHeadView;
@property (nonatomic, strong) BrowseHeadView *brseHeadView;
@property (nonatomic, strong) RecommondNews *rcdTableView;

@end

@implementation TopNewsScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT*2);
        self.delaysContentTouches = NO; // 默认是YES 设置NO 会调用touchesShuldBegin withEvent inContentView
        self.delegate = self;
//        _norHeadView = [[NTNHeadView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, vHeight)];
//        [self addSubview:_norHeadView];
        _rcdTableView = [[RecommondNews alloc] initWithFrame:CGRectMake(0, vHeight, SCREEN_WIDTH, SCREEN_HEIGHT*2-vHeight) style:UITableViewStylePlain];
        [self addSubview:_rcdTableView];
    }
    return self;
}

- (BOOL)touchesShouldBegin:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event inContentView:(UIView *)view {
    if ([view isKindOfClass:[RecommondNews class]]||[view isKindOfClass:[NTNHeadView class]]) {
        return NO;
    }
    return YES;
}

- (BOOL)touchesShouldCancelInContentView:(UIView *)view {
    return NO;
}

#pragma mark UIScrollViewDelegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    _decelerate = NO;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (_decelerate) {
        return;
    }
    if (scrollView.contentOffset.y > _lastY) { // 上推
        NSLog(@"上推 %f",scrollView.contentOffset.y);
        
        self.norHeadView.mj_y = 0;// headView 固定不动

        self.norHeadView.scrollViewState = ScrollViewUpState;
        self.norHeadView.offSetY = scrollView.contentOffset.y; //监控scrollView偏移量y

    } else { // 下拉
        NSLog(@"下拉 %f",scrollView.contentOffset.y);
        if(scrollView.contentOffset.y<vHeight&&scrollView.contentOffset.y>0) {
            self.norHeadView.mj_y = 0;
            self.norHeadView.scrollViewState = ScrollViewDownState;
            self.norHeadView.offSetY = scrollView.contentOffset.y;
            return;
        }
        
        self.norHeadView.mj_y = 0;
    }
    
    _lastY = scrollView.contentOffset.y;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (decelerate) {
        _decelerate = decelerate;
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
