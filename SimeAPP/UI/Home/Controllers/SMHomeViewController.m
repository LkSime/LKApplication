//
//  SMHomeViewController.m
//  SimeAPP
//
//  Created by LkSime on 16/7/6.
//  Copyright © 2016年 LkSime. All rights reserved.
//

#import "SMHomeViewController.h"

@interface SMHomeViewController () {
    UIButton * testButton;
}

@end

@implementation SMHomeViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        UITabBarItem * batItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:[UIImage imageNamed:@"tab_music_off"] selectedImage:[UIImage imageNamed:@"tab_music_on"]];
        [self setTabBarItem:batItem];
    }
    return self;
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self createView];
}

- (void)createView {
    testButton = [UIButton buttonWithType:UIButtonTypeCustom];
    testButton.tag = 110;
    [testButton setBackgroundColor:FlatBrown];
    [testButton setTitleColor:[UIColor colorWithContrastingBlackOrWhiteColorOn:FlatBrown isFlat:YES] forState:UIControlStateNormal];
    [testButton setTitle:@"lldb调试" forState:UIControlStateNormal];
    [testButton addTarget:self action:@selector(actionWithLLDBTest:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testButton];
    [testButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.height.equalTo(@160);
    }];
    NSLog(@"viewDidLoad中打印");
}

//免重启程序打印Log
/*
 1.右键点击断点编辑断点，首先选择Action,logMessage，再点击+,选择DebugerCommander，然后这里面的命令和右下角的lldb命令是完全一样的，这个命令你随意打。
 2.最重要的一步，勾选automaticlly continue after evalating value，这个可以使得程序不会中断继续执行。
 */

- (void)actionWithLLDBTest:(UIButton *)sender {
    SMLog(@"lldb调试~Button tag = %ld", (long)sender.tag);
    SMLog(@"%@", NSStringFromCGRect(sender.frame));
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
