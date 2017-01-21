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
    _tipname.returnKeyType=UIReturnKeyDone;
    _tipname.delegate=self;
    

}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{

    [_tipname resignFirstResponder];
    return YES;

}

- (IBAction)cancle:(id)sender {
    [self removeFromSuperview];
}
- (IBAction)save:(UIButton *)sender {
    
    SSTipModel * model=[[SSTipModel alloc]init];
    model.name=_tipname.text;
    model.isOn=NO;
    int select1=(int)[_picker selectedRowInComponent:0];
    NSString * str=[_array2 objectAtIndex:select1];
    int select2=(int)[_picker selectedRowInComponent:1];
    NSString * str2=[_array3 objectAtIndex:select2];

    NSMutableString * mutablestr=[[NSMutableString alloc]init];
    [mutablestr appendString:str];
    [mutablestr appendString:@":"];
    [mutablestr appendString:str2];
    
    model.time=mutablestr;
    
    [_mydelegate addTipWith:model];
    
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
