//
//  SomoViewCell.m
//  UCDemo
//
//  Created by syk on 2018/8/11.
//  Copyright © 2018年 UCDemo. All rights reserved.
//

#import "SomoViewCell.h"
#import "SomoView.h"
#import "FreeNewsModel.h"
#import "UIView+Somo.h"

@implementation SomoViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setLoading:(BOOL)loading {
    _loading = loading;
    if (loading) {
        [self beginSomo];
    } else {
        [self endSomo];
    }
}

- (UIColor *)somoSkeletonBackgroundColor {
    return [UIColor lightGrayColor];
}

- (NSArray<SomoView *> *)somoSkeletonLayout {
    SomoView *sm1 = [[SomoView alloc] initWithFrame:CGRectMake(SIZE_GAP_LEFT, SIZE_GAP_TOP, SCREEN_WIDTH - SIZE_GAP_LEFT*2-SIZE_GAP_BIG -SIZE_IMG, 22)];
    SomoView *sm2 = [[SomoView alloc] initWithFrame:CGRectMake(SIZE_GAP_LEFT, SIZE_GAP_TOP+SIZE_IMG-12, 50, 15)];
    SomoView *sm3 = [[SomoView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-SIZE_GAP_LEFT-SIZE_IMG, SIZE_GAP_TOP, SIZE_IMG, SIZE_IMG)];
    
    return @[sm1,sm2,sm3];
}




@end
