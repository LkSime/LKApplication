//
//  SMDatePicker.m
//  SimeAPP
//
//  Created by LkSime on 16/7/15.
//  Copyright © 2016年 LkSime. All rights reserved.
//

#import "SMDatePicker.h"

@interface SMDatePicker ()<UIPickerViewDelegate, UIPickerViewDataSource> {
    UIPickerView * _datePicker;
    
    NSMutableArray      * _yearsArray;
    NSArray      * _monthsArray;
    NSInteger nowYear ;
    NSInteger nowMonth;
    
    NSString * _selectDate;
}

@end

@implementation SMDatePicker

- (instancetype)initWithSuperView:(UIView *)superView {
    if (self = [super init]) {
        self.frame = CGRectMake(0, SCREEN_HEIGHT - 200, SCREEN_WIDTH, 200);
        [superView addSubview:self];
        self.backgroundColor = HexColor(@"f2f2f2");
        _yearsArray = [NSMutableArray array];
        _monthsArray = @[@"01", @"02", @"03", @"04", @"05", @"06",
                         @"07", @"08", @"09", @"10", @"11", @"12"];
        NSCalendar *cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        NSDateComponents* componentsMax  = [cal components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:[NSDate date]];
        nowYear = [componentsMax year];
        nowMonth = [componentsMax month];
        
        [self createView];
    }
    return self;
}

- (void)createView{
    
    for (NSInteger i = 1950; i < nowYear + 1; i++) {
        NSString * year = [NSString stringWithFormat:@"%ld", i];
        [_yearsArray addObject:year];
    }
    UIView * spaceView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 3)];
    spaceView.backgroundColor = [UIColor colorWithComplementaryFlatColorOf:FlatLime withAlpha:0.6f];
    [self addSubview:spaceView];
    
    _datePicker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 3, SCREEN_WIDTH, 160)];
    _datePicker.delegate = self;
    _datePicker.dataSource = self;
    [_datePicker selectRow:2 inComponent:0 animated:YES];
    [self addSubview:_datePicker];

    UIButton * cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelButton.frame = CGRectMake(1, _datePicker.bounds.origin.y + _datePicker.bounds.size.height, SCREEN_WIDTH /2 - 4, 40);
    [cancelButton setTitleColor:FlatMaroon forState:UIControlStateNormal];
    [cancelButton setBackgroundColor:[UIColor colorWithComplementaryFlatColorOf:FlatMaroon]];
    [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(actionOfCancel) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:cancelButton];
    
    UIButton * confirmButton = [UIButton buttonWithType:UIButtonTypeCustom];
    confirmButton.frame = CGRectMake(SCREEN_WIDTH / 2 +2, _datePicker.bounds.origin.y + _datePicker.bounds.size.height, SCREEN_WIDTH /2 - 4, 40);
    [confirmButton setTitleColor:FlatMaroon forState:UIControlStateNormal];
    [confirmButton setBackgroundColor:[UIColor colorWithComplementaryFlatColorOf:FlatMaroon]];
    [confirmButton setTitle:@"确定" forState:UIControlStateNormal];
    [confirmButton addTarget:self action:@selector(actionOfConfirm) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:confirmButton];

}
#pragma mark - 该方法的返回值决定该控件包含多少列
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}
#pragma mark - 该方法的返回值决定该控件指定列包含多少个列表项
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return _yearsArray.count;
    } else {
        return 12;
    }
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 40;
}
#pragma mark - 该方法返回的NSString将作为UIPickerView中指定列和列表项的标题文本
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == 0) {
        
        //判断当前年份的月份是否超出范围
        NSInteger rowYear = [pickerView selectedRowInComponent:component];
        NSString * yearName = _yearsArray[rowYear];
        NSInteger rowMonth = [pickerView selectedRowInComponent:1];

        if (([yearName integerValue] == nowYear) && (rowMonth > nowMonth)) {
            [pickerView selectRow:(nowMonth - 1) inComponent:1 animated:YES];
        }
        
        return _yearsArray[row];
    } else {
        return _monthsArray[row];
    }
}
#pragma mark - 当用户选中UIPickerViewDataSource中指定列和列表项时激发该方法
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if(1 == component) {
        NSInteger rowYear = [pickerView selectedRowInComponent:0];
        NSString * yearName = _yearsArray[rowYear];

        NSInteger rowMonth = [_monthsArray[row] integerValue];
        if (([yearName integerValue] == nowYear) && (rowMonth > nowMonth)) {
            [pickerView selectRow:(nowMonth - 1) inComponent:1 animated:YES];
        }
    }
    NSInteger rowYear = [pickerView selectedRowInComponent:0];
    NSInteger rowMonth = [pickerView selectedRowInComponent:1];

    NSString * yearName = _yearsArray[rowYear];
    NSString * monthName = _monthsArray[rowMonth];
    _selectDate = [NSString stringWithFormat:@"%@-%@", yearName, monthName];
}
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    UIView * itemView = view;
    if (!itemView) {
        itemView = [[UIView alloc] init];
        itemView.backgroundColor = FlatMint;
        
        UILabel* pickerLabel = [[UILabel alloc] init];
        [pickerLabel setTextAlignment:NSTextAlignmentRight];
        [pickerLabel setFont:[UIFont boldSystemFontOfSize:22.0f]];
        pickerLabel.text=[self pickerView:pickerView titleForRow:row forComponent:component];
        [itemView addSubview:pickerLabel];
        [pickerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(itemView);
            make.width.equalTo(@60);
            make.height.equalTo(@30);
        }];
    }
    return itemView;
}

#pragma mark - 显示
- (void)show {
    NSDateFormatter *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"yyyy-MM"];
    NSString * dateStr=[dateformatter stringFromDate:_currentDate];
    NSArray *array = [dateStr componentsSeparatedByString:@"-"];
    NSUInteger yIndex = [_yearsArray indexOfObject:array.firstObject];
    NSUInteger mIndex = [_monthsArray indexOfObject:array.lastObject];
    [_datePicker selectRow:yIndex inComponent:0 animated:YES];
    [_datePicker selectRow:mIndex inComponent:1 animated:YES];
}
#pragma mark - ActionEvent
- (void)actionOfCancel {
    [self removeFromSuperview];
}
- (void)actionOfConfirm {
    if (self.selectDateBlock) {
        self.selectDateBlock(_selectDate);
    }
}

@end
