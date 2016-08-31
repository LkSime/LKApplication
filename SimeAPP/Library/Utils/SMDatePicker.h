//
//  SMDatePicker.h
//  SimeAPP
//
//  Created by LkSime on 16/7/15.
//  Copyright © 2016年 LkSime. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SMDatePicker : UIControl

/**
 *  Title on the top of SMDatePicker
 */
@property (nonatomic, copy) NSString *title;

/**
 *  specify min/max date range. default is nil. When min > max, the values are ignored.
 */
@property (nonatomic, strong) NSDate *minimumDate;
@property (nonatomic, strong) NSDate *maximumDate;
/**
 *  当前日期
 */
@property (nonatomic, strong) NSDate *currentDate;

@property (nonatomic, copy) void (^selectDateBlock)(NSString * sDate);

- (instancetype)initWithSuperView:(UIView *)superView;

///显示选择器
- (void)show;
@end
