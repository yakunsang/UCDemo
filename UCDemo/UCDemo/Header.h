//
//  Header.h
//  UCDemo
//
//  Created by syk on 2018/8/6.
//  Copyright © 2018年 UCDemo. All rights reserved.
//

#ifndef Header_h
#define Header_h
#define Tabbar_Title_HColor [UIColor colorWithRed:19/255.0 green:34/255.0 blue:122/255.0 alpha:1]
#define Tabbar_Title_NColor [UIColor colorWithRed:112/255.0 green:112/255.0 blue:112/255.0 alpha:1]

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
// ShowApi接口
static NSString  *const ChannelIdArray = @"ChannelIdArray";
static NSString  *const ShowApiURL = @"http://route.showapi.com/109-34"; //channelIdList频道
static NSString  *const ShowApiContentURL = @"https://route.showapi.com/109-35"; //新闻内容


#define ws(as) __weak typeof (self)(as) = self;
#endif /* Header_h */
