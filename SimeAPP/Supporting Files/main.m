//
//  main.m
//  SimeAPP
//
//  Created by LkSime on 16/7/4.
//  Copyright © 2016年 LkSime. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @try {
        @autoreleasepool {
            return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
        }
    }
    @catch (NSException *exception) {
        NSLog(@"Stack Trace:%@",[exception callStackSymbols]);
    }
}
