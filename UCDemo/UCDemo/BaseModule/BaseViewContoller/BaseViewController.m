//
//  BaseViewController.m
//  UCDemo
//
//  Created by syk on 2018/8/3.
//  Copyright © 2018年 UCDemo. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initNavigation {
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

#pragma mark NoDataView
- (void)noDataView {
    
}

- (void)clickNoDataView {
    
}



#pragma mark NoNetworkView
- (void)noNetworkView {
    
}

- (void)clickNoNetworkView {
    
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
