//
//  SMStartViewController.m
//  SimeAPP
//
//  Created by LkSime on 16/7/6.
//  Copyright © 2016年 LkSime. All rights reserved.
//

#import "SMStartViewController.h"
#import "SMHomeViewController.h"
#import "SMMineViewController.h"
#import "AppDelegate.h"

@interface SMStartViewController ()<UITabBarControllerDelegate>

@end

@implementation SMStartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = HexColor(@"f2f2f2");
    [self createViewControllers];
}
- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = YES;
}
- (void)createViewControllers {
    UITabBarController * tabbarController = [[UITabBarController alloc] init];
    tabbarController.delegate = self;
    AppDelegate *aDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    aDelegate.mtabBarController = tabbarController;

    SMHomeViewController * homeVC = [SMHomeViewController new];
    UINavigationController * homeNav = [[UINavigationController alloc] initWithRootViewController:homeVC];
    homeNav.navigationBarHidden = YES;
    
    SMMineViewController * VC = [SMMineViewController new];
    UINavigationController * vcNav = [[UINavigationController alloc] initWithRootViewController:VC];
    vcNav.navigationBarHidden = YES;
    
    tabbarController.viewControllers = [NSMutableArray arrayWithObjects:
                                        homeNav,
                                        vcNav,
                                        nil];

    tabbarController.tabBar.tintColor = [UIColor redColor];
    [tabbarController setSelectedIndex:0];
    
    [self.navigationController pushViewController:tabbarController animated:YES];


}

#pragma mark - TabbarController Delegate
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    BOOL ret = YES;
    return ret;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    
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
