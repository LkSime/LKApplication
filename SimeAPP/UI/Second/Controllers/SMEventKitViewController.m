//
//  SMEventKitViewController.m
//  SimeAPP
//
//  Created by LkSime on 16/7/6.
//  Copyright © 2016年 LkSime. All rights reserved.
//

#import "SMEventKitViewController.h"
#import <EventKit/EventKit.h>

@interface SMEventKitViewController ()

@end

@implementation SMEventKitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton * eventButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [eventButton addTarget:self action:@selector(addEvent)
          forControlEvents:UIControlEventTouchUpInside];
    [eventButton setTitle:@"添加提醒" forState:UIControlStateNormal];
    [eventButton setBackgroundColor:[UIColor colorWithComplementaryFlatColorOf:FlatRed]];
    [self.view addSubview:eventButton];
    [eventButton makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.equalTo(@100);
        make.height.equalTo(@40);
    }];
    
    UIButton * calendarButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [calendarButton addTarget:self action:@selector(actionWithSelectDate)
          forControlEvents:UIControlEventTouchUpInside];
    [calendarButton setTitle:@"添加提醒" forState:UIControlStateNormal];
    [calendarButton setBackgroundColor:FlatRed];
    [self.view addSubview:calendarButton];
    [calendarButton makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(eventButton.mas_bottom).offset(20);
        make.width.equalTo(@100);
        make.height.equalTo(@40);
    }];

}

- (void)addEvent {
    EKEventStore * eStore = [[EKEventStore alloc] init];
    NSDate * nowDate = [NSDate date];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:nowDate];
    NSDate *localeDate = [nowDate dateByAddingTimeInterval:interval];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSString * dayStr = [[dateFormatter stringFromDate:localeDate] substringToIndex:11];
    NSDate *aDate = [dateFormatter dateFromString:[NSString stringWithFormat:@"%@ 10:00:00", dayStr]];


    [eStore requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError * _Nullable error) {
        if (granted) {
            EKAlarm * alarm = [EKAlarm alarmWithAbsoluteDate:aDate];
            EKEvent * event = [EKEvent eventWithEventStore:eStore];
            event.title = @"四米提醒事件测试-10点3";
            event.startDate = aDate;
            event.endDate = [aDate dateByAddingTimeInterval:3600];
            [event setAllDay:YES];
            [event addAlarm:alarm];
            [event setCalendar:[eStore defaultCalendarForNewEvents]];
            [eStore saveEvent:event span:EKSpanThisEvent commit:YES error:nil];
            
            NSError * err = nil;
            if ([eStore saveEvent:event span:EKSpanThisEvent commit:YES error:&err]) {
                NSLog(@"添加成功");
            } else {
                NSLog(@"添加失败");
            }
        } else {
            NSLog(@"%@", error);
        }
    }];
    
    [eStore requestAccessToEntityType:EKEntityTypeReminder completion:^(BOOL granted, NSError *error) {
        if (granted) {
        
            EKAlarm *alarm = [EKAlarm alarmWithAbsoluteDate:aDate];
            
            EKReminder *reminder = [EKReminder reminderWithEventStore:eStore];
            reminder.title = @"This is a reminder";
            NSCalendar *cal = [NSCalendar currentCalendar];
            [cal setTimeZone:[NSTimeZone systemTimeZone]];
            NSInteger flags = NSCalendarUnitYear | NSCalendarUnitMonth |
            NSCalendarUnitDay |NSCalendarUnitHour | NSCalendarUnitMinute |
            NSCalendarUnitSecond;
            
            reminder.startDateComponents = [cal components:flags fromDate:[aDate dateByAddingTimeInterval:30]];//开始时间
            reminder.dueDateComponents = [cal components:flags fromDate:[aDate dateByAddingTimeInterval:30]]; //结束时间
            reminder.completionDate = [aDate dateByAddingTimeInterval:30];
            [reminder setCalendar:[eStore defaultCalendarForNewReminders]];
            reminder.priority = 1;//优先级
            [reminder addAlarm:alarm];
            
            NSError *err = nil;
            if([eStore saveReminder:reminder commit:YES error:&err]){
                NSLog(@"saved!");
            }else{
                NSLog(@"%@",err);
            }
        }else{
            NSLog(@"%@",error);
        }
    }];
}

- (void)actionWithSelectDate {
    
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
