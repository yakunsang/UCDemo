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

@interface TopNewsController ()

@property (nonatomic, strong) RecommondNews *recommondTable;
@property (nonatomic, strong) NSMutableArray<FreeNewsModel *> *dataArray;

@end

@implementation TopNewsController

- (void)viewDidLoad {
    self.recommondTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self requestTopNews];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (RecommondNews *)recommondTable {
    if(!_recommondTable) {
        _recommondTable = [[RecommondNews alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
        [self.view addSubview:_recommondTable];
    }
    
    return _recommondTable;
}

- (void)requestTopNews {
    UCNetworkTarget *target = [UCNetworkTarget initWithTarget:self];
    target.successSelector = @selector(requestSuccess:);
    target.failedSelector = @selector(requestFaild:);
    
    [UCNetworkService uc_get:@"" params:@{} target:target];
}



- (void)requestFaild:(NSError *)error {
    
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
    NSDictionary *data = response[@"data"];
    
    if (data&&[data isKindOfClass:[NSDictionary class]]) {
        dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
            NSArray *touTiaoArray = data[@"toutiao"];
            self.dataArray = [FreeNewsModel getModelsfromArray:touTiaoArray].mutableCopy;
            dispatch_semaphore_signal(semaphore);
        });
        dispatch_async(dispatch_get_main_queue(), ^{
            dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
            self.recommondTable.dataArray = self.dataArray;
            dispatch_semaphore_signal(semaphore);
        });

    }
}

- (void)requestFail:(NSError *)error {
    
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
