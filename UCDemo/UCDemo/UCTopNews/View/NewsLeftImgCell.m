//
//  NewsLeftImgCell.m
//  UCDemo
//
//  Created by syk on 2018/8/8.
//  Copyright © 2018年 UCDemo. All rights reserved.
//

#import "NewsLeftImgCell.h"
#import "FreeNewsModel.h"

@interface NewsLeftImgCell ()

@property (nonatomic, strong) UIImageView *leftImgV;

@end

@implementation NewsLeftImgCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _leftImgV = [UIImageView new];
        [self.contentView addSubview:_leftImgV];
        self.separatorInset = UIEdgeInsetsZero;
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

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.leftImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(SIZE_GAP_TOP);
        make.right.mas_equalTo(-SIZE_GAP_LEFT);
        make.size.mas_equalTo(CGSizeMake(SIZE_IMG, SIZE_IMG));
    }];
}

- (void)drawRect:(CGRect)rect {
    __weak __typeof(self) weakSelf = self;
    self.leftImgV.image = nil;
    if (self.title.length == 0) return; // 空数据返回
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 整个内容的背景
    CGContextSetFillColorWithColor(context, [UIColor lightGrayColor].CGColor);
    // 新闻标题
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:18],NSFontAttributeName, nil];
    [self.title drawInRect:CGRectMake(SIZE_GAP_LEFT, SIZE_GAP_TOP, SCREEN_WIDTH-SIZE_IMG - SIZE_GAP_LEFT*2, 100) withAttributes:dic];
    
    // 作者
    CGFloat totalHeight = 0.0;
    if (self.model.titleSize.height < SIZE_IMG + SIZE_GAP_TOP) {
        [self.model.source drawInRect:CGRectMake(SIZE_GAP_LEFT, SIZE_GAP_TOP + SIZE_IMG - SIZE_GAP_SMALL - self.model.autherSize.height , SCREEN_WIDTH/2, self.model.autherSize.height) withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12],NSForegroundColorAttributeName:[UIColor lightGrayColor]}];
        totalHeight = SIZE_GAP_TOP + SIZE_IMG;
    } else {
        [self.model.source drawInRect:CGRectMake(SIZE_GAP_LEFT, SIZE_GAP_TOP + SIZE_IMG + SIZE_GAP_SMALL + self.model.autherSize.height , self.model.autherSize.width, self.model.autherSize.height) withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12],NSForegroundColorAttributeName:[UIColor lightGrayColor]}];
        totalHeight = SIZE_GAP_TOP + self.model.autherSize.height;
    }
    // 占位图
    UIImage *img = [UIColor createImageWithColor:[UIColor lightGrayColor]];
    self.leftImgV.image = img;

    // 图片儿
    if (self.model.picInfo.count>0) {
        PicInfo *picInfo = self.model.picInfo[0];
        [[SDWebImageManager sharedManager] loadImageWithURL:[NSURL URLWithString:picInfo.url] options:SDWebImageContinueInBackground|SDWebImageCacheMemoryOnly progress:nil completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, SDImageCacheType cacheType, BOOL finished, NSURL * _Nullable imageURL) {
            if (finished) {
                weakSelf.leftImgV.image = image;
            } else {
                weakSelf.leftImgV.image = img;
            }
        }];
    }

    // 下划线
    CGContextSetStrokeColorWithColor(context, [UIColor lightGrayColor].CGColor);
    CGContextSetLineWidth(context, 1);
    CGContextMoveToPoint(context, SIZE_GAP_LEFT, totalHeight+SIZE_GAP_BIG);
    CGContextAddLineToPoint(context,SCREEN_WIDTH -SIZE_GAP_LEFT , totalHeight+SIZE_GAP_BIG);
    CGContextStrokePath(context);
}

- (void)setModel:(FreeNewsModel *)model {
    _model = model;
    self.title = model.title;
    [self setNeedsDisplay];
}

@end
