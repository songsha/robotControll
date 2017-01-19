//
//  SSAddTipView.m
//  RobotControl
//
//  Created by apple on 17/1/19.
//  Copyright © 2017年 ss. All rights reserved.
//

#import "SSAddTipView.h"

@implementation SSAddTipView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame{

    if (self=[super initWithFrame:frame]) {
        _navcLabel.userInteractionEnabled=YES;
        
        NSArray* nibView = [[NSBundle mainBundle] loadNibNamed:@"SSAddTipView" owner:nil options:nil];
        self=[nibView firstObject];
        self.frame=frame;
//        self.view=[nibView firstObject];
//        [self addSubview:self.view];
        [self createUI];
    }
    return self;
}
-(void)createUI{
    _array2=[[NSArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",nil];
    _array3=[[NSArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",nil];
    _picker.delegate=self;
    _picker.dataSource=self;

}
- (IBAction)cancle:(id)sender {
    [self removeFromSuperview];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
{
    return 2;
}
// returns the # of rows in each component..
//每列的个数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;{
    
    if (component==0) {
        return _array2.count;
    }
//    if (component==1) {
        //  NSLog(@"_cityArray.count===%ld",_cityArray.count);
        return _array3.count;
//    }
//    return _districtArray.count;
    
}
- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component __TVOS_PROHIBITED;
{
    // NSLog(@"%d",row);
    if (component==0) {
        return [_array2 objectAtIndex:row];
    }

        
     
        return [_array3 objectAtIndex:row];
   
 
}
@end
