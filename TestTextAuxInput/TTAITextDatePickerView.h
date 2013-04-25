//
//  TTAITextDatePickerView.h
//
//  Created by Doug Lovell on 4/19/13.
//  Copyright (c) 2013 Douglas Lovell. MIT License.
//

#import "TTAITextAuxInputView.h"

@interface TTAITextDatePickerView : TTAITextAuxInputView

@property (nonatomic, strong) NSDateFormatter* dateFormatter;

// set the new mode, return the old
- (UIDatePickerMode) setDatePickerMode:(UIDatePickerMode)mode;


@end
