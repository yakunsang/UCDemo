//
//  NewsDetailController.m
//  UCDemo
//
//  Created by syk on 2018/8/11.
//  Copyright © 2018年 UCDemo. All rights reserved.
//

#import "NewsDetailController.h"
#import <WebKit/WebKit.h>

@interface NewsDetailController ()

@property (nonatomic, strong) WKWebView *webView;

@end

@implementation NewsDetailController

- (void)viewDidLoad {
    [self.view addSubview:self.webView];
    [self requestWebService];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)initNavigation {
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}
- (void)viewWillAppear:(BOOL)animated {
    [self initNavigation];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Networking
- (void)requestWebService {
    if (self.webURL.length == 0) {
        return;
    }
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:self.webURL]];
    [self.webView loadRequest:request];
}

#pragma mark setter/getter

- (WKWebView *)webView {
    if (!_webView) {
        WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
        _webView = [[WKWebView alloc] initWithFrame:self.view.bounds configuration:config];
    }
    return _webView;;
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
