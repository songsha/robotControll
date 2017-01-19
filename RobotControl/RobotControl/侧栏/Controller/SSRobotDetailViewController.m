
//
//  SSRobotDetailViewController.m
//  RobotControl
//
//  Created by apple on 17/1/11.
//  Copyright © 2017年 ss. All rights reserved.
//

#import "SSRobotDetailViewController.h"

@interface SSRobotDetailViewController ()

@end

@implementation SSRobotDetailViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden=YES;
    self.navigationController.navigationBar.tintColor=[UIColor whiteColor];
    [self createNavcBar];

}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.navigationController.navigationBar.tintColor=[UIColor whiteColor];
    [self createNavcBar];
}

-(void)viewWillDisappear:(BOOL)animated{

    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden=NO;

}
-(void)createNavcBar{
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbar"] forBarMetrics:UIBarMetricsDefault];
    UILabel * lable=[[UILabel alloc]initWithFrame:CGRectMake(SCREENW/2-40, 5, 80, 35)];
    lable.backgroundColor=[UIColor clearColor];
    lable.text=@"当前机器人";
    lable.textColor=[UIColor whiteColor];
    self.navigationItem.titleView=lable;
    
    UIButton * button=[[UIButton alloc]initWithFrame:CGRectMake(0, 3, 50, 40)];
    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    UIImageView * image=[[UIImageView alloc]initWithFrame:CGRectMake(-15, 5, 30, 30)];
    image.image=[UIImage imageNamed:@"返回"];
    [button addSubview:image];
    UILabel *label2=[[UILabel alloc]initWithFrame:CGRectMake(10, 0, 20, 40)];
    label2.text=@" ";
    label2.textColor=[UIColor whiteColor];
    [button addSubview:label2];
    
    UIBarButtonItem * item=[[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.leftBarButtonItem=item;
    
}

-(void)back{
    [self.navigationController popViewControllerAnimated:NO];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    [self createUI];
}

-(void)createUI{
    
    
    _robotbgLabel=[[UILabel alloc]initWithFrame:CGRectMake(15, 90, SCREENW-30, 70)];
    _robotbgLabel.backgroundColor=THEMECOLOR;
    _robotbgLabel.layer.cornerRadius=5;
    _robotbgLabel.layer.masksToBounds=YES;
    _robotnameLabel=[[UILabel alloc]initWithFrame:CGRectMake(5, 5, SCREENW-40, 30)];
    _robotnameLabel.text=@"昵称:8888888";
    _robotnameLabel.font=[UIFont systemFontOfSize:15];
    [_robotbgLabel addSubview:_robotnameLabel];
    
    _robotnoLabel=[[UILabel alloc]initWithFrame:CGRectMake(5, 35, SCREENW-40, 30)];
    _robotnoLabel.text=@"序列号:88873782929786";
    _robotnoLabel.font=[UIFont systemFontOfSize:15];
    _robotnoLabel.textColor=[UIColor grayColor];
    [_robotbgLabel addSubview:_robotnoLabel];
    
    
    UIImageView * img=[[UIImageView alloc]initWithFrame:CGRectMake(SCREENW-40-35, 20, 30, 30)];
    img.image=[UIImage imageNamed:@"phone_uncheck"];
    [_robotbgLabel addSubview:img];
    
    [self.view addSubview:_robotbgLabel];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
