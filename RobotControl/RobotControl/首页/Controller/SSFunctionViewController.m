//
//  ViewController.m
//  RobotControl
//
//  Created by apple on 17/1/4.
//  Copyright © 2017年 ss. All rights reserved.
//

#import "SSFunctionViewController.h"
#import "AppDelegate.h"
#import "SSRobotDetailViewController.h"

@interface SSFunctionViewController ()<SSTabChangeDelegate>
{
    int a;
}
@end

@implementation SSFunctionViewController
-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    [self createNavcBar];
    self.navigationController.navigationBar.hidden=NO;

    
}

-(void)createNavcBar{
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbar"] forBarMetrics:UIBarMetricsDefault];
    UILabel * lable=[[UILabel alloc]initWithFrame:CGRectMake(SCREENW/2-40, 5, 80, 35)];
    lable.backgroundColor=[UIColor clearColor];
    lable.text=@"首页";
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
    
}

-(void)back{
//    [self.navigationController popViewControllerAnimated:NO];
    AppDelegate * delega=(AppDelegate *)[UIApplication sharedApplication].delegate;
    UIView * transitionView=[delega.window.subviews objectAtIndex:1];

    if(transitionView.frame.origin.x==0){
        transitionView.frame=CGRectMake(SCREENW-70, 0, SCREENW, SCREENH);
        delega.slidView.shadowView.alpha=0;

    }
    else
    {
        transitionView.frame=CGRectMake(0, 0, SCREENW, SCREENH);
        delega.slidView.shadowView.alpha=1;
        
    }
}

//-(void)viewDidAppear:(BOOL)animated{
//    [super viewDidAppear:animated];
//    
//    
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"首页";
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor=[UIColor whiteColor];
    a=0;
    UIButton * button=[[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    [button setBackgroundColor:[UIColor redColor]];
    [button addTarget:self action:@selector(a) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    AppDelegate * delega=(AppDelegate *)[UIApplication sharedApplication].delegate;
    delega.slidView.tabdelegate=self;
    
}
-(void)a{
    AppDelegate * delega=(AppDelegate *)[UIApplication sharedApplication].delegate;
    UIView * transitionView=[delega.window.subviews objectAtIndex:1];
  //  transitionView.frame=CGRectMake(100, 0, SCREENW, SCREENH);;
//UIView * transitionView = [[delega.view subviews] objectAtIndex:0];
    if (a==0) {
        //self.tabBarController.view.frame=CGRectMake(100, 0, SCREENW, SCREENH);
         transitionView.frame=CGRectMake(100, 0, SCREENW, SCREENH);;
        
       // self.navigationController.view.frame=CGRectMake(100, 0, SCREENW, SCREENH);
        
        a=1;
    }
    else
    {
       // self.navigationController.view.frame=CGRectMake(0, 0, SCREENW, SCREENH);
         transitionView.frame=CGRectMake(0, 0, SCREENW, SCREENH);;
        self.tabBarController.view.frame=CGRectMake(0, 0, SCREENW, SCREENH);
        a=0;
    }
    
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
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
