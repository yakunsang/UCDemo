//
//  NTNHeadView.m
//  UCDemo
//
//  Created by syk on 2018/8/22.
//  Copyright © 2018年 UCDemo. All rights reserved.
//

#import "NTNHeadView.h"

@interface NTNHeadView()

@property (nonatomic, strong) UITextField *searchTextField;
@property (nonatomic, strong) UIImageView *bottomImgV;
@property (nonatomic, strong) UIView *maskView;

@end

@implementation NTNHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        _searchTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 70, SCREEN_WIDTH-40, 50)];
        _searchTextField.placeholder = @"搜索或输入网址";
        
        _bottomImgV = [[UIImageView alloc] initWithFrame:CGRectMake(20, 125, SCREEN_WIDTH-40, vHeight-125)];
        _bottomImgV.image = [UIImage imageNamed:@"test.jpg"];
        
        [self addSubview:_searchTextField];
        [self addSubview:_bottomImgV];
        
        _maskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 300)];
        _maskView.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5];
        _maskView.hidden = YES;
        [self addSubview:_maskView];
    }
    return self;
}



- (void)setOffSetY:(CGFloat)offSetY {
    if (self.scrollViewState == ScrollViewUpState) {
        self.maskView.hidden = NO;
        
        if (offSetY<50) {
            CGFloat scale = (vHeight-offSetY)/vHeight;
            NSLog(@"\n scale = %f",scale);
            self.bottomImgV.hidden = NO;
            self.bottomImgV.transform = CGAffineTransformMakeScale(scale,scale);;
        } else {
            self.bottomImgV.hidden = YES;
            self.bottomImgV.transform = CGAffineTransformIdentity;
        }
    } else {
        if (offSetY<50&&offSetY>0) {
            self.maskView.hidden = NO;
            CGFloat scale = (vHeight-offSetY)/vHeight;
            NSLog(@"\n scale = %f",scale);
            self.bottomImgV.hidden = NO;
            self.maskView.alpha = 1-scale;
            self.bottomImgV.transform = CGAffineTransformMakeScale(scale, scale);
        } else {
            self.maskView.hidden = YES;
            self.bottomImgV.transform = CGAffineTransformIdentity;
        }
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
