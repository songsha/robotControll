//
//  SSInfoTableHeadButton.m
//  RobotControl
//
//  Created by apple on 17/1/16.
//  Copyright © 2017年 ss. All rights reserved.
//

#import "SSInfoTableHeadButton.h"

@implementation SSInfoTableHeadButton



-(instancetype)initWithFrame:(CGRect)frame{

    if (self=[super initWithFrame:frame]) {
        [self createUI];
    }
    return self;
}
-(void)createUI{

    UIImageView * image1=[[UIImageView alloc]initWithFrame:CGRectMake(20, 10, self.frame.size.height-20,  self.frame.size.height-20)];
    image1.image=[UIImage imageNamed:@"main_action_select"];
    [self addSubview:image1];
    
    UILabel * label=[[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.height-14+20+5, 7, 120, self.frame.size.height-14)];
    label.text=@"当前机器人";
    label.font=[UIFont systemFontOfSize:15];
    label.textColor=[UIColor whiteColor];
    [self addSubview:label];
    
    UIImageView * imge2=[[UIImageView alloc]initWithFrame:CGRectMake(self.frame.size.width-self.frame.size.height+10, 7, self.frame.size.height-14, self.frame.size.height-14)];
    [self addSubview:imge2];
    imge2.image=[UIImage imageNamed:@"rightpush"];

    UILabel * line=[[UILabel alloc]initWithFrame:CGRectMake(0, self.frame.size.height-0.5,self.frame.size.width, 0.5)];
    line.backgroundColor=[UIColor groupTableViewBackgroundColor];
    [self addSubview:line];
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
