//
//  NewsDefaultCell.m
//  UCDemo
//
//  Created by syk on 2018/8/8.
//  Copyright © 2018年 UCDemo. All rights reserved.
//

#import "NewsDefaultCell.h"

static CGFloat titleWidth = 150;

@implementation NewsDefaultCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
//1, 初始化时,没有设置rect大小,将直接导致drawrect不被自动调用
//2, drawrect调用是在Controller->loadView, Controller->viewdidload之后调用的
//3, drawrect是在sizeToFit调用后被调用,sizeToFit会自动调用sizeThatFits 子类应该重写SizeThatFits sizeToFit可手动调用 (sizeToFit,SizeThatFits只对本身负责,对subview无作用)
//4, 设置contentMode属性为UIViewContentModeRedraw.将在没在改变frame的时候调用drawrect
//5, 直接调用setNeedDisplay, 或者setNeedsDisplayInRect:触发drawRect(前提条件rect不为0)

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    UILabel *titleView = [UILabel new];
    titleView.backgroundColor = [UIColor lightGrayColor];
    [titleView drawTextInRect:CGRectMake(20, 20, titleWidth, 44)];
    
    UILabel *subView = [UILabel new];
    subView.backgroundColor = [UIColor lightGrayColor];
    [subView drawTextInRect:CGRectMake(20, 84, titleWidth*2/3, 44)];
    
    UILabel *imgView = [UILabel new];
    imgView.backgroundColor = [UIColor grayColor];
    [imgView drawTextInRect:CGRectMake(rect.size.width-100, rect.size.height/2-40, 80, 80)];
}

@end
