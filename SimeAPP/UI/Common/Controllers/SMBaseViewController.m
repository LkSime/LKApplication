//
//  SMBaseViewController.m
//  SimeAPP
//
//  Created by LkSime on 16/7/6.
//  Copyright © 2016年 LkSime. All rights reserved.
//

#import "SMBaseViewController.h"

@interface SMBaseViewController ()

@end

@implementation SMBaseViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = HexColor(@"f2f2f2");
}
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];

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
