//
//  SSFuncButton.m
//  RobotControl
//
//  Created by apple on 17/1/16.
//  Copyright © 2017年 ss. All rights reserved.
//

#import "SSFuncButton.h"
#import "Masonry.h"

@implementation SSFuncButton




-(instancetype)initWithFrame:(CGRect)frame{

    if (self=[super initWithFrame:frame]) {
        [self createUI];
    }
    return self;

}
-(void)createUI{
    _circleImg=[[UIImageView alloc]init];
    [self addSubview:_circleImg];
    [_circleImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.bottom.left.equalTo(self);
    }];
    
    _funcImg=[[UIImageView alloc]init];
    [self addSubview:_funcImg];
    
    [_funcImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_circleImg).offset(10);
        make.centerX.equalTo(_circleImg);
        make.centerY.equalTo(_circleImg).multipliedBy(0.6);
        make.width.equalTo(_funcImg.mas_height);
    }];
   
    _funcName=[[UILabel alloc]init];
    [self addSubview:_funcName];
    
    [_funcName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_funcImg.mas_bottom).offset(10);
        make.right.left.equalTo(_circleImg).offset(0);
//        make.bottom.equalTo(_circleImg).offset(-5);
        make.height.equalTo(@20);
    }];
    
    _funcName.textAlignment=NSTextAlignmentCenter;
    _funcName.textColor=sColor(60, 93, 140);
    _funcName.font=[UIFont systemFontOfSize:11];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
