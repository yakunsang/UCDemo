//
//  NewsLeftImgCell.m
//  UCDemo
//
//  Created by syk on 2018/8/8.
//  Copyright © 2018年 UCDemo. All rights reserved.
//

#import "NewsLeftImgCell.h"
#import "NewsModel.h"
<<<<<<< HEAD

@interface NewsLeftImgCell ()

@property (nonatomic, strong) UIImageView *leftImgV;

@end

=======
>>>>>>> 62196b04de44404b1cfec32386618342f8cc2030
@implementation NewsLeftImgCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
<<<<<<< HEAD
        _leftImgV = [UIImageView new];
        [self.contentView addSubview:_leftImgV];
        self.separatorInset = UIEdgeInsetsZero;
=======
        self.backgroundColor = [UIColor whiteColor];
>>>>>>> 62196b04de44404b1cfec32386618342f8cc2030
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
        make.top.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
}

- (void)drawRect:(CGRect)rect {
    __weak __typeof(self) weakSelf = self;
//        CGContextRef context = UIGraphicsGetCurrentContext();
        // 整个内容的背景
//        [UIColor colorWithRed:250/255.0 green:250/255.0 blue:250/255.0 alpha:1];
    
<<<<<<< HEAD
        // 新闻标题
        [self.title drawInRect:CGRectMake(20, 20, CGRectGetWidth(rect)-140, 100) withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}];
        
//        CGContextFillRect(context, rect);
        UIImage *img = [UIColor createImageWithColor:[UIColor lightGrayColor]];
        self.leftImgV.image = img;
        if (self.title.length>0) {
            [[YYWebImageManager sharedManager] requestImageWithURL:[NSURL URLWithString:weakSelf.model.thumbnail_pic_s] options:YYWebImageOptionAllowBackgroundTask|YYWebImageOptionUseNSURLCache progress:nil transform:nil completion:^(UIImage * _Nullable image, NSURL * _Nonnull url, YYWebImageFromType from, YYWebImageStage stage, NSError * _Nullable error) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    weakSelf.leftImgV.image = image;
                });
            }];
        }
=======
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 整个内容的背景
    [UIColor whiteColor];
    
    // 新闻标题
    [self.title drawInRect:CGRectMake(20, 20, self.model.titleSize.width, self.model.titleSize.height) withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}];
    
    CGContextFillRect(context, rect);
    
>>>>>>> 62196b04de44404b1cfec32386618342f8cc2030
}

- (void)setModel:(NewsModel *)model {
    _model = model;
    self.title = model.title;
    [self setNeedsDisplay];
}

@end
