//
//  SSSlideView.h
//  RobotControl
//
//  Created by apple on 17/1/11.
//  Copyright © 2017年 ss. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol SSTabChangeDelegate <NSObject>

-(void)changetabFrame;
-(void)changeview;
-(void)pushtoSet;

@end
@interface SSSlideView : UIView<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,weak) id<SSTabChangeDelegate>tabdelegate;
@property (nonatomic,strong) UIImageView * imgbg;
@property (nonatomic,strong)UIImageView * headImg;
@property (nonatomic,strong)UILabel * nameLabel;
@property (nonatomic,strong)UITableView * infoTable;
@property (nonatomic,strong) UIButton * setButton;
@property (nonatomic,copy)NSArray * titleArray;



@end
