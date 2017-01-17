//
//  SSInformationViewController.m
//  RobotControl
//
//  Created by apple on 17/1/10.
//  Copyright © 2017年 ss. All rights reserved.
//

#import "SSInformationViewController.h"
#import "AppDelegate.h"
#import "SSRobotDetailViewController.h"
#import "SSTipViewController.h"
#import "SSSetViewController.h"
@interface SSInformationViewController ()<SSTabChangeDelegate>

@end

@implementation SSInformationViewController
-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    [self createNavcBar];
    self.navigationController.navigationBar.hidden=NO;
    AppDelegate * delega=(AppDelegate *)[UIApplication sharedApplication].delegate;
    delega.slidView.tabdelegate=self;

    
}

-(void)createNavcBar{
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbar"] forBarMetrics:UIBarMetricsDefault];
    UILabel * lable=[[UILabel alloc]initWithFrame:CGRectMake(SCREENW/2-40, 5, 80, 35)];
    lable.backgroundColor=[UIColor clearColor];
    lable.text=@"消息列表";
    lable.textColor=[UIColor whiteColor];
    self.navigationItem.titleView=lable;
    
    UIButton * button=[[UIButton alloc]initWithFrame:CGRectMake(0, 3, 50, 40)];
    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    UIImageView * image=[[UIImageView alloc]initWithFrame:CGRectMake(5, 10, 20, 20)];
    image.image=[UIImage imageNamed:@"main_nav_left_bar_item"];
    [button addSubview:image];
    UILabel *label2=[[UILabel alloc]initWithFrame:CGRectMake(10, 0, 20, 40)];
    label2.text=@" ";
    label2.textColor=[UIColor whiteColor];
    [button addSubview:label2];
    
    UIBarButtonItem * item=[[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.leftBarButtonItem=item;
    
    
    UIButton * rightButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 10, 40, 40)];
    rightButton.titleLabel.font=[UIFont systemFontOfSize:17];
    [rightButton setTitle:@"清空" forState:UIControlStateNormal];
    UIBarButtonItem * rightitem=[[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem=rightitem;
    
}

-(void)back{
    [self.navigationController popViewControllerAnimated:NO];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    self.title=@"消息";
   }
-(void)changetabFrame{
    
    // self.navigationController.view.frame=CGRectMake(0, 0, SCREENW, SCREENH);
    
    self.tabBarController.view.frame=CGRectMake(0, 0, SCREENW, SCREENH);
}

-(void)changeview{
    SSRobotDetailViewController * robot=[[SSRobotDetailViewController alloc]init];
    [self.navigationController pushViewController:robot animated:YES];
    AppDelegate * delega=(AppDelegate *)[UIApplication sharedApplication].delegate;
    UIView * transitionView=[delega.window.subviews objectAtIndex:1];
    transitionView.frame=CGRectMake(0, 0, SCREENW, SCREENH);;
    
}
-(void)pushtoSet{
    SSSetViewController * set=[[SSSetViewController alloc]init];
    [self.navigationController pushViewController:set animated:NO];
    AppDelegate * delega=(AppDelegate *)[UIApplication sharedApplication].delegate;
    UIView * transitionView=[delega.window.subviews objectAtIndex:1];
    transitionView.frame=CGRectMake(0, 0, SCREENW, SCREENH);;

    
    
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
