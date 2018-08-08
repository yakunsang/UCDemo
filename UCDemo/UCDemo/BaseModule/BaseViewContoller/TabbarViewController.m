//
//  TabbarViewController.m
//  UCDemo
//
//  Created by syk on 2018/8/6.
//  Copyright © 2018年 UCDemo. All rights reserved.
//

#import "TabbarViewController.h"
#import "TopNewsController.h"
#import "VedioController.h"
#import "MenuController.h"
#import "WindowsController.h"
#import "MyViewController.h"

@interface TabbarViewController ()<UITabBarControllerDelegate>

@property (nonatomic, strong) TopNewsController *topVC;
@property (nonatomic, strong) VedioController *vedioVC;
@property (nonatomic, strong) MenuController *menuVC;
@property (nonatomic, strong) WindowsController *windowVC;
@property (nonatomic, strong) MyViewController *myVC;

@end

@implementation TabbarViewController

- (instancetype)init {
    if (self = [super init]) {
        self.delegate = self;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    for (NSInteger i = 0; i < 5; i++) {
        switch (i) {
            case 0:
                {
                    self.topVC = [[TopNewsController alloc] init];
                    self.topVC.tabBarItem = [self getTabbarWithTitle:@"头条" normal:@"uc_home_normal" heigh:@"uc_home_high"];
                }
                break;
            case 1:
                {
                    self.vedioVC = [[VedioController alloc] init];
                    self.vedioVC.tabBarItem = [self getTabbarWithTitle:@"视频" normal:@"uc_vedio_normal" heigh:@"uc_vedio_heigh"];
                }
                break;
            case 2:
                {
                    self.menuVC = [[MenuController alloc] init];
                    self.menuVC.tabBarItem = [self getTabbarWithTitle:@"菜单" normal:@"uc_menu_normal" heigh:@"uc_menu_heigh"];
                }
                break;
            case 3:
                {
                    self.windowVC = [[WindowsController alloc] init];
                    self.windowVC.tabBarItem = [self getTabbarWithTitle:@"窗口" normal:@"uc_subscribe_normal" heigh:@"uc_subscribe_heigh"];
                }
                break;
            case 4:
                {
                    self.myVC = [[MyViewController alloc] init];
                    UITabBarItem *myTabbar = [[UITabBarItem alloc] initWithTitle:@"首页" image:[UIImage imageNamed:@"uc_my_normal"] tag:0];
                    self.myVC.tabBarItem = myTabbar;
//                    self.myVC.tabBarItem = [self getTabbarWithTitle:@"首页" normal:@"uc_my_normal" heigh:@"uc_my_heigh"];
                }
                break;
            default:
                break;
        }
    }
    
    self.viewControllers = @[self.topVC,self.vedioVC,self.menuVC,self.windowVC,self.myVC];

    // Do any additional setup after loading the view.
}

- (UITabBarItem *)getTabbarWithTitle:(NSString *)tile normal:(NSString *)normal heigh:(NSString *)heigh {
    UITabBarItem *tabbarItem = [[UITabBarItem alloc] initWithTitle:tile image:[UIImage imageNamed:normal] selectedImage:[UIImage imageNamed:heigh]];
    [tabbarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:Tabbar_Title_NColor} forState:UIControlStateNormal];
    [tabbarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:Tabbar_Title_HColor} forState:UIControlStateSelected];
    
    return tabbarItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark tabbarDeleagte

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    if ([viewController isKindOfClass:[MenuController class]]) {
        return NO;
    }
    if ([viewController isKindOfClass:[WindowsController class]]) {
        return NO;
    }
    if (![viewController isKindOfClass:[MyViewController class]]) {
        self.myVC.tabBarItem.title = @"首页";
    }
    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    if ([viewController isKindOfClass:[MyViewController class]]) {
        if ([viewController.tabBarItem.title isEqualToString:@"首页"]) {
            viewController.tabBarItem.title = @"我的";
            viewController.tabBarItem.selectedImage = [[UIImage imageNamed:@"uc_my_heigh"] imageWithRenderingMode:UIImageRenderingModeAutomatic];
            self.selectedIndex = 4;
        } else {
            viewController.tabBarItem.title = @"首页";
            viewController.tabBarItem.selectedImage = [[UIImage imageNamed:@"uc_my_normal"] imageWithRenderingMode:UIImageRenderingModeAutomatic];
            self.selectedIndex = 0;
        }
    }
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
