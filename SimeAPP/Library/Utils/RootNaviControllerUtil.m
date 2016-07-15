//
//  RootNaviControllerUtil.m
//  doctor
//
//  Created by 郑章民 on 16/3/21.
//  Copyright © 2016年 1ping.com. All rights reserved.
//

#import "RootNaviControllerUtil.h"
#import "AppDelegate.h"

@implementation RootNaviControllerUtil

+(UINavigationController *)getRootNavigation{
    return ((AppDelegate*)[UIApplication sharedApplication].delegate).rootNavigation;
}

+(void)pushViewController:(UIViewController *)vc animated:(BOOL)animated{
    [[RootNaviControllerUtil getRootNavigation] pushViewController:vc animated:animated];
}

+(void)popViewControllerAnimated:(BOOL)animated{
    [[RootNaviControllerUtil getRootNavigation] popViewControllerAnimated:animated];
}

+(void)popToRootViewControllerAnimated:(BOOL)animated{
    [[RootNaviControllerUtil getRootNavigation] popToRootViewControllerAnimated:animated];
}

+(UIViewController *)topViewController{
    return [[RootNaviControllerUtil getRootNavigation] topViewController];
}



@end
