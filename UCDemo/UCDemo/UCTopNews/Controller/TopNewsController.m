//
//  TopNewsController.m
//  UCDemo
//
//  Created by syk on 2018/8/6.
//  Copyright © 2018年 UCDemo. All rights reserved.
//

#import "TopNewsController.h"
#import "TopNewsScrollView.h"
#import "FreeNewsModel.h"
#import "SAChannelModel.h"
#import "SAContentModel.h"
#import "BrowseHeadView.h"
#import "NTNHeadView.h"

@interface TopNewsController ()

@property (nonatomic, strong) BrowseHeadView *brseHeadView;
@property (nonatomic, strong) NTNHeadView *norHeadView;
@property (nonatomic, strong) TopNewsScrollView *topScrollView;
@property (nonatomic, strong) NSMutableArray<SAContentModel *> *dataArray;

@end

@implementation TopNewsController

- (void)viewDidLoad {
    [self initBrseHeadView];
    [self initTopScrollView];
    [self requestChannelIds];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)initBrseHeadView {
    _norHeadView = [[NTNHeadView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, vHeight)];
    [self.view addSubview:_norHeadView];
}

- (void)initTopScrollView {
    ws(weakSelf);
    _topScrollView = [[TopNewsScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    if (@available(iOS 11.0,*)) {
        _topScrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    _topScrollView.scrollContentOffset = ^(CGFloat contentOffset, ScrollViewState state) {
        if (state == ScrollViewUpState) {
            weakSelf.norHeadView.scrollViewState = ScrollViewUpState;
            [weakSelf.norHeadView setOffSetY:contentOffset];
        } else {
            weakSelf.norHeadView.y = contentOffset;
            weakSelf.norHeadView.scrollViewState = ScrollViewDownState;
            [weakSelf.norHeadView setOffSetY:contentOffset];
            [weakSelf.view setNeedsLayout];
            [weakSelf.view layoutIfNeeded];
        }
    };
    [self.view addSubview:_topScrollView];
}

- (void)requestChannelIds {
    UCNetworkTarget *target = [UCNetworkTarget initWithTarget:self];
    target.successSelector = @selector(requestSuccess:);
    target.failedSelector = @selector(requestFail:);
    
    [UCNetworkService uc_get:ShowApiURL params:@{} target:target];
}

- (void)requestTopNews {
    UCNetworkTarget *target = [UCNetworkTarget initWithTarget:self];
    target.successSelector = @selector(requestTopNewsSuccess:);
    target.failedSelector = @selector(requestTopNewsFail:);
    NSData *arrData = [[NSUserDefaults standardUserDefaults] objectForKey:ChannelIdArray];
    
    NSArray *array = [NSKeyedUnarchiver unarchiveObjectWithData:arrData];
    SAChannelModel *model = array[0];
    NSDictionary *dic = [[NSDictionary alloc] initWithObjectsAndKeys:model.channelId,@"channelId",model.name,@"channelName",@"足球",@"title",@"1",@"page",@"0",@"needContent",@"0",@"needHtml",@"0",@"needAllList",@"20",@"maxResult",@"",@"id", nil];
    
    [UCNetworkService uc_post:ShowApiContentURL params:dic target:target];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)requestSuccess:(id)response {
    NSDictionary *data = response[@"showapi_res_body"];
    ws(weakSelf);
    if (data&&[data isKindOfClass:[NSDictionary class]]) {
        dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
            self.dataArray = [SAChannelModel getChannelModelsFromDic:data].mutableCopy;
            dispatch_semaphore_signal(semaphore);
        });
        dispatch_async(dispatch_get_main_queue(), ^{
            dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
            [weakSelf requestTopNews];
            dispatch_semaphore_signal(semaphore);
        });

    }
}

- (void)requestFail:(NSError *)error {
    
}

- (void)requestTopNewsSuccess:(id)respose {
    NSDictionary *pagebean = respose[@"showapi_res_body"][@"pagebean"];
    if (pagebean&&pagebean.allKeys.count>0) {
        self.dataArray = [SAContentModel getModelFromArray:pagebean[@"contentlist"]].mutableCopy;
        dispatch_async(dispatch_get_main_queue(), ^{

        });
    }
}

- (void)requestTopNewsFail:(NSError *)error {
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
