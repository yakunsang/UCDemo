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
    CGFloat startY;
}

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) RecommondNews *rcdTableView;
@property (nonatomic, strong) NTNHeadView *norHeadView;
@property (nonatomic, strong) BrowseHeadView *brseHeadView;

@end

@implementation TopNewsScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor redColor];
        
        _scrollView = [[UIScrollView alloc] initWithFrame:frame];
        _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT*2);
        if (@available(iOS 11.0,*)) {
            _scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        _norHeadView = [[NTNHeadView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 300)];
        _rcdTableView = [[RecommondNews alloc] initWithFrame:CGRectMake(0, 300, SCREEN_WIDTH, SCREEN_HEIGHT*2-300) style:UITableViewStylePlain];
        [_scrollView addSubview:_norHeadView];
        [_scrollView addSubview:_rcdTableView];
        [self addSubview:_scrollView];
    }
    return self;
}

#pragma mark PanGestureDelegate

- (void)panGesture {
    
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    NSLog(@"%@",gestureRecognizer.view);
    switch (gestureRecognizer.state) {
        case UIGestureRecognizerStateChanged:
            NSLog(@"%@",touch);
            break;
            
        default:
            break;
    }
    return NO;
}


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRequireFailureOfGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

#pragma mark UIScrollViewDelegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    startY = scrollView.contentOffset.y;
//    NSLog(@"\n startY = %f",startY);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    NSLog(@"%f",scrollView.contentOffset.y);
    if (scrollView.contentOffset.y>0) {
        if (scrollView.contentOffset.y>startY) { // 上推
            
        } else { // 下拉
            
        }
    } else {
        if (scrollView.contentOffset.y<startY) { // 下拉
            
        } else { //上推
            
        }
    }
    
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
