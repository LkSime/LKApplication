//
//  OPDeviceMacro.h
//  doctor
//
//  Created by LkSime on 16/3/18.
//  Copyright © 2016年 1ping.com. All rights reserved.
//

#ifndef OPDeviceMacro_h
#define OPDeviceMacro_h

//---------------屏幕宽高----------------
#define SCREEN_WIDTH            [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT           [UIScreen mainScreen].bounds.size.height

//暂时放这里，后续处理
#define resizableImageWithImageName(name)  [[UIImage imageNamed:name] resizableImageWithCapInsets:UIEdgeInsetsMake([UIImage imageNamed:name].size.height * 0.5, [UIImage imageNamed:name].size.width * 0.5, [UIImage imageNamed:name].size.height * 0.5, [UIImage imageNamed:name].size.width * 0.5)]

#endif /* OPDeviceMacro_h */

#define ISPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

#define IOS5_OR_LATER   ( [[[UIDevice currentDevice] systemVersion] floatValue] >= 5.0 )
#define IOS7_OR_LATER   ( [[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0 )
#define IOS8_OR_LATER   ( [[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0 )

#define TipAlert(_S_, ...)     [[[UIAlertView alloc] initWithTitle:@"提示" message:[NSString stringWithFormat:(_S_), ##__VA_ARGS__] delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil] show]

