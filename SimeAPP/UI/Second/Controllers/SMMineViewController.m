//
//  SMMineViewController.m
//  SimeAPP
//
//  Created by LkSime on 16/7/7.
//  Copyright © 2016年 LkSime. All rights reserved.
//

#import "SMMineViewController.h"
#import "SMEventKitViewController.h"

@interface SMMineViewController (){
    UIButton * showButton;
}
@property (nonatomic, strong)  UIView * backView;

@end

@implementation SMMineViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        UITabBarItem * batItem = [[UITabBarItem alloc] initWithTitle:@"我的"
                                                               image:[UIImage imageNamed:@"tab_mine_off"]
                                                       selectedImage:[UIImage imageNamed:@"tab_mine_on"]];
        [self setTabBarItem:batItem];
        
    }
    return self;
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    self.tabBarController.tabBar.hidden = NO;

}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.backView = [[UIView alloc] init];
    [self.view addSubview:_backView];
    [self.backView makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.equalTo(@100);
        make.height.equalTo(@200);
    }];
    
    //互补色
    [self createView:[UIColor colorWithComplementaryFlatColorOf:FlatSkyBlue]];
    
    showButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [showButton setTitle:@"点击显示" forState:UIControlStateNormal];
    [showButton setBackgroundColor:FlatSkyBlue];
    //对比色
    [showButton setTitleColor:[UIColor colorWithContrastingBlackOrWhiteColorOn:FlatSkyBlue isFlat:YES]
                     forState:UIControlStateNormal];
    [showButton addTarget:self action:@selector(actionWithShow)
         forControlEvents:UIControlEventTouchUpInside];
    
    [self.backView addSubview:showButton];
    [showButton makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.backView);
        make.width.equalTo(@100);
        make.height.equalTo(@100);
    }];
}
- (void)actionWithShow {
    SMEventKitViewController * eventVC = [SMEventKitViewController new];
    [self.navigationController pushViewController:eventVC animated:YES];
}

- (void)createView:(UIColor *)color {
    _backView.backgroundColor = color;
    
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
