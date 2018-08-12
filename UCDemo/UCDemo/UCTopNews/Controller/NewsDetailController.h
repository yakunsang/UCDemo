//
//  NewsDetailController.h
//  UCDemo
//
//  Created by syk on 2018/8/11.
//  Copyright © 2018年 UCDemo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface NewsDetailController : BaseViewController

@property (nonatomic, copy) NSString *webURL;
@property (nonatomic, strong) id <NewsDetailModule> interface;

@end
