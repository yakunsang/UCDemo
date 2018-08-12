//
//  NewsDetailModulASI.m
//  UCDemo
//
//  Created by syk on 2018/8/11.
//  Copyright © 2018年 UCDemo. All rights reserved.
//

#import "NewsDetailModuleSI.h"
#import "NewsDetailController.h"
@implementation NewsDetailModuleSI
@synthesize callback;

@synthesize url;

@synthesize serverBody;

- (UIViewController *)serverBody {
    if (!serverBody) {
        serverBody = [[NewsDetailController  alloc] init];
        ((NewsDetailController *)serverBody).interface = self;
        ((NewsDetailController *)serverBody).webURL = url;
    }
    return serverBody;
}
@end
