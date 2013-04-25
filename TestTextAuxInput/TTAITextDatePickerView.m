//
//  TTAITextDatePickerView.m
//
//  Created by Doug Lovell on 4/19/13.
//  Copyright (c) 2013 Douglas Lovell. MIT License.
//

#import "TTAITextDatePickerView.h"

@interface TTAITextDatePickerView ()

@property (nonatomic, strong) UIDatePicker* dateTimePicker;

@end


@implementation TTAITextDatePickerView

- (NSDateFormatter *) dateFormatter {
    if (_dateFormatter == nil) {
        _dateFormatter = [[NSDateFormatter alloc] init];
        [_dateFormatter setDateStyle:NSDateFormatterShortStyle];
        [_dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    }
    return _dateFormatter;
}

- (id)init
{
    self = [super init];
    if (self) {
        self.dateTimePicker = [[UIDatePicker alloc ]initWithFrame:CGRectMake(0,0,100,44)];
    }
    return self;
}

- (void)dateChanged {
    NSString *dateTimeText = [[self dateFormatter] stringFromDate:self.dateTimePicker.date];
    [self.txtActiveField setText:dateTimeText];
}

- (void)decorate:(UITextField *)textField {
    [super decorate:textField];
    [self.dateTimePicker addTarget:self action:@selector(dateChanged) forControlEvents:UIControlEventValueChanged];
    [textField setInputView:self.dateTimePicker];
}

-(void)textFieldDidBeginEditing:(UITextField*)textField {
    [super textFieldDidBeginEditing:textField];
    NSString* stringValue = [textField text];
    if (0 < [stringValue length]) {
         NSDate *curDate = [[self dateFormatter] dateFromString:stringValue];
        [self.dateTimePicker setDate:curDate];
    }
}

@end
