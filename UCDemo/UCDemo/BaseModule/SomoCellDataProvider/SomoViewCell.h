//
//  SomoViewCell.h
//  UCDemo
//
//  Created by syk on 2018/8/11.
//  Copyright © 2018年 UCDemo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SomoSkeletonLayoutProtocl.h"
#import "BaseNewsCell.h"

@interface SomoViewCell : BaseNewsCell<SomoSkeletonLayoutProtocl>

@property (nonatomic, assign) BOOL loading;

@end
