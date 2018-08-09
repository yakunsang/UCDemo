//
//  TopNewsController.m
//  UCDemo
//
//  Created by syk on 2018/8/6.
//  Copyright © 2018年 UCDemo. All rights reserved.
//

#import "TopNewsController.h"
#import "RecommondNews.h"
#import "NewsModel.h"

@interface TopNewsController ()

@property (nonatomic, strong) RecommondNews *recommondTable;
@property (nonatomic, strong) NSMutableArray<NewsModel *> *dataArray;
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
    
    [UCNetworkService uc_get:@"" params:@{@"type":@"top"} target:target];
}

- (void)requestSuccess:(id)response {
    NSDictionary *result = response[@"result"];
    if ([result isKindOfClass:[NSDictionary class]]) {
        self.dataArray = [NewsModel getModelsWithDic:result].mutableCopy;
        self.recommondTable.dataArray = self.dataArray;
    }
}

- (void)requestFaild:(NSError *)error {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
