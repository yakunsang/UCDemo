//
//  NewsBottomThreeImgCell.m
//  UCDemo
//
//  Created by syk on 2018/8/8.
//  Copyright © 2018年 UCDemo. All rights reserved.
//

#import "NewsBottomThreeImgCell.h"
#import "SAContentModel.h"

@implementation NewsBottomThreeImgCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentSView = [UIScrollView new];
        [self addSubview:self.contentSView];
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
    [super drawRect:rect];
    if (self.model.title.length<= 0) return;
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //新闻标题
    CGFloat titleHeight = [NSString getHeightWithStr:self.model.title Width:SCREEN_WIDTH-SIZE_GAP_LEFT*2 fontSize:18];
    [self.model.title drawInRect:CGRectMake(SIZE_GAP_LEFT, SIZE_GAP_TOP,SCREEN_WIDTH-SIZE_GAP_LEFT*2, titleHeight) withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18]}];
    
    // 图片
    self.contentSView.frame = CGRectMake(SIZE_GAP_LEFT, titleHeight+SIZE_GAP_BIG+SIZE_GAP_TOP, SCREEN_WIDTH-SIZE_GAP_LEFT*2, SIZE_IMG);
    self.contentSView.scrollEnabled = self.model.imageurls.count>3;
    self.contentSView.pagingEnabled = YES;
    self.contentSView.contentSize = CGSizeMake(self.model.imageurls.count*SIZE_IMG_WIDTH, SIZE_IMG);
    self.contentSView.bounces = YES;
    
    UIImage *placeHolder = [UIImage sk_imageWithColor:[UIColor lightGrayColor]];
    for (NSInteger i = 0; i < self.model.imageurls.count; i++) {
        ImgInfo *img = self.model.imageurls[i];
        CGFloat x = 0.0;
        if (i!=0) {
            x = i*SIZE_IMG_WIDTH + 1.5;
        } else {
            x = i*SIZE_IMG_WIDTH;
        }
        UIImageView *imagV = [[UIImageView alloc] initWithFrame:CGRectMake(x, 0, SIZE_IMG_WIDTH, SIZE_IMG)];
        [imagV sd_setImageWithURL:[NSURL URLWithString:img.url] placeholderImage:placeHolder];
        [self.contentSView addSubview:imagV];
    }
    
    // 来源
    [self.model.source drawInRect:CGRectMake(SIZE_GAP_LEFT, titleHeight+SIZE_GAP_BIG*2+SIZE_GAP_TOP+SIZE_IMG, self.model.autherSize.width, self.model.autherSize.height) withAttributes:@{NSForegroundColorAttributeName:[UIColor lightGrayColor],NSFontAttributeName:[UIFont systemFontOfSize:12]}];
    
    //底线
    CGFloat totalHeight = 0.0;
    
    totalHeight = titleHeight+SIZE_GAP_TOP+SIZE_GAP_BIG*3+SIZE_IMG+self.model.autherSize.height;
    
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
