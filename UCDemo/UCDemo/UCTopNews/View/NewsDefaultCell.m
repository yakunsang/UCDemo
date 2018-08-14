//
//  NewsDefaultCell.m
//  UCDemo
//
//  Created by syk on 2018/8/8.
//  Copyright © 2018年 UCDemo. All rights reserved.
//

#import "NewsDefaultCell.h"
#import "SAContentModel.h"

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
//    __weak __typeof(self) weakSelf = self;
    self.leftImgV.image = nil;
    if (self.model.title.length == 0) return; // 空数据返回
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 新闻标题
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:18],NSFontAttributeName, nil];
    [self.model.title drawInRect:CGRectMake(SIZE_GAP_LEFT, SIZE_GAP_TOP, self.model.titleSize.width, self.model.titleSize.height) withAttributes:dic];
    
    //subTitle
    self.leftImgV.image = nil;
    [self.model.desc drawInRect:CGRectMake(SIZE_GAP_LEFT, self.model.titleSize.height+SIZE_GAP_TOP+SIZE_GAP_SMALL, self.model.descSize.width, self.model.descSize.height) withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13],NSForegroundColorAttributeName:[UIColor lightGrayColor]}];
    
    // 作者
    [self.model.source drawInRect:CGRectMake(SIZE_GAP_LEFT, SIZE_GAP_TOP + self.model.descSize.height + SIZE_GAP_SMALL*2+self.model.titleSize.height, self.model.autherSize.width, self.model.autherSize.height) withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12],NSForegroundColorAttributeName:[UIColor lightGrayColor]}];
    
    // 下划线
    CGFloat totalHeight = 0.0;
    totalHeight = SIZE_GAP_TOP*2 + SIZE_GAP_SMALL*2 +self.model.titleSize.height + self.model.descSize.height+self.model.autherSize.height;
    
    CGContextSetStrokeColorWithColor(context, [UIColor lightGrayColor].CGColor);
    CGContextSetLineWidth(context, 0.5);
    CGContextMoveToPoint(context, SIZE_GAP_LEFT, totalHeight-0.5);
    CGContextAddLineToPoint(context,SCREEN_WIDTH -SIZE_GAP_LEFT , totalHeight-0.5);
    CGContextStrokePath(context);
}

- (void)setModel:(SAContentModel *)model {
    [super setModel:model];
    [self setNeedsDisplay];
}
@end
