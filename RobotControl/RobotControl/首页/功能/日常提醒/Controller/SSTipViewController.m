//
//  SSTipViewController.m
//  RobotControl
//
//  Created by apple on 17/1/16.
//  Copyright © 2017年 ss. All rights reserved.
//

#import "SSTipViewController.h"

@interface SSTipViewController ()

@end

@implementation SSTipViewController

-(void)viewWillDisappear:(BOOL)animated{
    
    self.tabBarController.tabBar.hidden=NO;
    
    
}
-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    [self createNavcBar];
    self.tabBarController.tabBar.hidden=YES;

}

-(void)createNavcBar{
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbar"] forBarMetrics:UIBarMetricsDefault];
    UILabel * lable=[[UILabel alloc]initWithFrame:CGRectMake(SCREENW/2-40, 5, 80, 35)];
    lable.backgroundColor=[UIColor clearColor];
    lable.text=@"日常提醒";
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
    // Do any additional setup after loading the view from its nib.
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
