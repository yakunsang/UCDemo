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
    [super viewDidLoad];
    [self initRecommondTable];
    [self requestNews];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initRecommondTable {
        _recommondTable = [[RecommondNews alloc] init];
        
        [self.view addSubview:_recommondTable];
        [_recommondTable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view);
            make.left.equalTo(self.view);
            make.size.mas_equalTo(CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height));
        }];
}

- (void)requestNews {
    UCNetworkTarget *target = [UCNetworkTarget initWithTarget:self];
    target.successSelector = @selector(requestSuccess:);
    target.failedSelector = @selector(requestFail:);
    
    [UCNetworkService uc_get:@"" params:@{@"type":@"top"} target:target];
}

- (void)requestSuccess:(id)response {
    NSDictionary *result = response[@"result"];
    
    if (result&&[result isKindOfClass:[NSDictionary class]]) {
        self.dataArray = [NewsModel getModelFromData:result].mutableCopy;
        self.recommondTable.dataArray = self.dataArray;
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
