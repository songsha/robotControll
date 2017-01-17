//
//  SSSlideView.m
//  RobotControl
//
//  Created by apple on 17/1/11.
//  Copyright © 2017年 ss. All rights reserved.
//

#import "SSSlideView.h"
#import "Masonry.h"
#import "SSInfoTableHeadButton.h"


#define BGHEIGHT 200

@implementation SSSlideView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame{

    if (self=[super initWithFrame:frame]) {
        [self createUI];
    }
    return self;
}
-(void)createUI{

    _titleArray=@[@"昵称: ",@"序列号: ",@"在线状态: "];
    
//    UIButton * button=[[UIButton alloc]initWithFrame:CGRectMake(10, 100, 40, 40)];
//    button.backgroundColor=[UIColor whiteColor];
//    [button addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
//    [self addSubview:button];
    
    
    _imgbg=[[UIImageView alloc]init];
    [self addSubview:_imgbg];
       [_imgbg mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self).offset(0);
        make.left.equalTo(self).offset(0);
        make.right.equalTo(self).offset(0);
        make.height.equalTo(@BGHEIGHT);
    }];
    _imgbg.image=[UIImage imageNamed:@"catbg"];

    
    _headImg=[[UIImageView alloc]init];
    [self addSubview:_headImg];
    _headImg.image=[UIImage imageNamed:@"头像"];
    
    [_headImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_imgbg);
        make.centerY.equalTo(_imgbg);
        make.height.width.equalTo(@(BGHEIGHT/3));
    }];
    
    _nameLabel=[[UILabel alloc]init];
    [self addSubview:_nameLabel];
    _nameLabel.textAlignment=NSTextAlignmentCenter;
    _nameLabel.text=@"59937510000832761";
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(_headImg.mas_bottom).offset(5);
        make.left.equalTo(self).offset(0);
        make.right.equalTo(self).offset(0);
        make.height.equalTo(@40);
  
    }];
//
    _infoTable=[[UITableView alloc]init];
    _infoTable.backgroundColor=sColor(28, 125, 250);
    [self addSubview:_infoTable];
    _infoTable.delegate=self;
    _infoTable.dataSource=self;
    [_infoTable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_imgbg.mas_bottom).offset(0);
        make.left.equalTo(self).offset(0);
        make.right.equalTo(self).offset(0);
        make.bottom.equalTo(self).offset(-60);
           }];
    
    UIView * view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENW-70, 0.5)];
    view.backgroundColor=sColor(155, 172, 202);
    _infoTable.tableFooterView=view;
    
    
    SSInfoTableHeadButton * footView=[[SSInfoTableHeadButton alloc]initWithFrame:CGRectMake(0, 0, SCREENW-70, 45)];
    footView.backgroundColor=sColor(20, 95, 200);
    [footView addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    _infoTable.tableHeaderView=footView;
    
    
    _setButton=[[UIButton alloc]init];
    [self addSubview:_setButton];
    
    [_setButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(_infoTable).offset(5);
        make.bottom.equalTo(self).offset(5);
        make.centerX.equalTo(self);
        make.width.equalTo(@80);
        make.height.equalTo(@50);

    }];

    [_setButton setTitle:@"设置" forState:UIControlStateNormal];
    _setButton.titleLabel.font=[UIFont systemFontOfSize:17];
   [ _setButton setImage:[UIImage imageNamed:@"phone_uncheck"] forState:UIControlStateNormal];
    
    [_setButton addTarget:self action:@selector(set) forControlEvents:UIControlEventTouchUpInside];
    
    self.backgroundColor=sColor(28, 125, 250);
    UITapGestureRecognizer * tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(move)];
    [self addGestureRecognizer:tap];

}
//-(void)pushtoDetail{
// [self.tabdelegate changeview];
//
//
//}


-(void)set{


    [self.tabdelegate pushtoSet];


}
-(void)move{
    
    [self.tabdelegate changetabFrame];

}

-(void)push{

    [self.tabdelegate changeview];

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{

    return 3;

}
// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

{

    UITableViewCell * cell= [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.textLabel.text=[NSString stringWithFormat:@"%@%@",_titleArray[indexPath.row],@"8888888"];
    cell.textLabel.font=[UIFont systemFontOfSize:13];
    cell.backgroundColor=sColor(28, 125, 250);
    cell.textLabel.alpha=0.8;
    return cell;
}

@end
