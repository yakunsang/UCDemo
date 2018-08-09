//
//  NewsLeftImgCell.m
//  UCDemo
//
//  Created by syk on 2018/8/8.
//  Copyright © 2018年 UCDemo. All rights reserved.
//

#import "NewsLeftImgCell.h"
#import "NewsModel.h"
@implementation NewsLeftImgCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor whiteColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return self;
}

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
    [UIColor whiteColor];
    
    // 新闻标题
    [self.title drawInRect:CGRectMake(20, 20, self.model.titleSize.width, self.model.titleSize.height) withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}];
    
    CGContextFillRect(context, rect);
    
}

- (void)setModel:(NewsModel *)model {
    _model = model;
    self.title = model.title;
    [self setNeedsDisplay];
}

@end
