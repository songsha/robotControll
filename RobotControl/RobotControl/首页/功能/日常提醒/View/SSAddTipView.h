//
//  SSAddTipView.h
//  RobotControl
//
//  Created by apple on 17/1/19.
//  Copyright © 2017年 ss. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSAddTipView : UIView<UIPickerViewDelegate,UIPickerViewDataSource>
@property (strong, nonatomic) IBOutlet UILabel *navcLabel;

@property (strong, nonatomic) IBOutlet UIButton *cancle;
@property (strong, nonatomic) IBOutlet UIButton *save;

@property (strong, nonatomic) IBOutlet UIPickerView *picker;
@property (strong, nonatomic) IBOutlet UITextField *tipname;
@property (nonatomic,copy)NSArray * array3;
@property (nonatomic,copy)NSArray * array2;
@property (nonatomic,strong) UIView * view;
@end
