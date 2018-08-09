//
//  NewsLeftImgCell.m
//  UCDemo
//
//  Created by syk on 2018/8/8.
//  Copyright © 2018年 UCDemo. All rights reserved.
//

#import "NewsLeftImgCell.h"
//#import "UIColor+image.h"

@implementation NewsLeftImgCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 整个内容的背景
    [UIColor colorWithRed:250/255.0 green:250/255.0 blue:250/255.0 alpha:1];
    
    // 新闻标题
    [self.title drawInRect:CGRectMake(0, 0, CGRectGetWidth(rect)-120, 100) withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}];
    
    CGContextFillRect(context, rect);
    

}

@end
