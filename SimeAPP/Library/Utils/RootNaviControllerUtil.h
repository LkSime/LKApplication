//
//  RootNaviControllerUtil.h
//  doctor
//
//  Created by 郑章民 on 16/3/21.
//  Copyright © 2016年 1ping.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AppDelegate;

@interface RootNaviControllerUtil : NSObject

+(UINavigationController *)getRootNavigation;

+(void)pushViewController:(UIViewController *)vc animated:(BOOL)animated;

+(void)popViewControllerAnimated:(BOOL)animated;

+(void)popToRootViewControllerAnimated:(BOOL)animated;

+(UIViewController *)topViewController;

@end
