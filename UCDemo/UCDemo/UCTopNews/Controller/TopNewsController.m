//
//  TopNewsController.m
//  UCDemo
//
//  Created by syk on 2018/8/6.
//  Copyright © 2018年 UCDemo. All rights reserved.
//

#import "TopNewsController.h"
#import "RecommondNews.h"
#import "FreeNewsModel.h"
#import "SAChannelModel.h"
#import "SAContentModel.h"

@interface TopNewsController ()

@property (nonatomic, strong) RecommondNews *recommondTable;
@property (nonatomic, strong) NSMutableArray<SAContentModel *> *dataArray;

@end

@implementation TopNewsController

- (void)viewDidLoad {
    self.recommondTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.recommondTable reloadData];
    [self requestChannelIds];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (RecommondNews *)recommondTable {
    if(!_recommondTable) {
        _recommondTable = [[RecommondNews alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
        [self.view addSubview:_recommondTable];
        _recommondTable.vc = self;
    }
    return _recommondTable;
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

- (void)initRecommondTable {
        _recommondTable = [[RecommondNews alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
        
        [self.view addSubview:_recommondTable];
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
            self.recommondTable.dataArray = self.dataArray;
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
