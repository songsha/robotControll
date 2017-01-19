//
//  SSHomePageViewController.m
//  RobotControl
//
//  Created by apple on 17/1/13.
//  Copyright © 2017年 ss. All rights reserved.
//

#import "SSHomePageViewController.h"
#import "AppDelegate.h"
#import "SSRobotDetailViewController.h"
#import "SSTipViewController.h"
#import "SSSetViewController.h"

@interface SSHomePageViewController ()<SSTabChangeDelegate>
@property (nonatomic,copy)NSArray * nameArray;
@property (nonatomic,copy)NSArray * imgArray;
@end
//@property (nonatomic,copy)NSArray * nameArray;
@implementation SSHomePageViewController




-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    [self createNavcBar];
    self.navigationController.navigationBar.hidden=NO;
   // self.tabBarController.tabBar.hidden=YES;
    AppDelegate * delega=(AppDelegate *)[UIApplication sharedApplication].delegate;
    delega.slidView.tabdelegate=self;

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
   // a=0;
//    UIButton * button=[[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
//    [button setBackgroundColor:[UIColor redColor]];
//    [button addTarget:self action:@selector(a) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:button];
//    
      [self createUI];
}

-(void)createUI{

     _nameArray=@[@"家居控制",@"视频监控",@"微聊",@"日常提醒",@"亲情号码",@"打电话",@"动作组",@"WIFI扫码"];
 _imgArray=@[@"main_btn_image_normal_0",@"main_btn_image_normal_1",@"main_btn_image_normal_2",@"main_btn_image_normal_3",@"main_btn_image_normal_4",@"main_btn_image_normal_5",@"main_btn_image_normal_6",@"main_btn_image_normal_7"];
    
    int line;
    if (_nameArray.count%3==0) {
        line=(int)_nameArray.count/3;
    }
    else
        line=(int)_nameArray.count/3+1;
 
    
    _functionScroll.contentSize=CGSizeMake(SCREENW, line*((SCREENW-60)/3.0)+20* _imgArray.count/3+10);

    for (int i=0; i<_nameArray.count; i++) {
        SSFuncButton * button=[[SSFuncButton alloc]initWithFrame:CGRectMake(10+i%3*20+(i%3)*(SCREENW-60)/3.0, 10+i/3*(SCREENW-60)/3.0+(i/3*20), (SCREENW-60)/3.0, (SCREENW-60)/3.0)];
        button.circleImg.image=[UIImage imageNamed:@"main_button_bg_image"];
        button.funcName.text=_nameArray[i];
        button.funcImg.image=[UIImage imageNamed:_imgArray[i]];
        button.tag=i+100;
        [button addTarget:self action:@selector(funcWithTag:) forControlEvents:UIControlEventTouchUpInside];
        [_functionScroll addSubview:button];
    }

}

-(void)funcWithTag:(UIButton *)button{

    SSTipViewController * tip=[[SSTipViewController alloc]init];
    [self.navigationController pushViewController:tip animated:NO];
    
    switch (button.tag) {
        case 100:
            
            break;
            
        default:
            break;
    }
    
    

}



//-(void)a{
//    AppDelegate * delega=(AppDelegate *)[UIApplication sharedApplication].delegate;
//    UIView * transitionView=[delega.window.subviews objectAtIndex:1];
//    //  transitionView.frame=CGRectMake(100, 0, SCREENW, SCREENH);;
//    //UIView * transitionView = [[delega.view subviews] objectAtIndex:0];
//    if (a==0) {
//        //self.tabBarController.view.frame=CGRectMake(100, 0, SCREENW, SCREENH);
//        transitionView.frame=CGRectMake(100, 0, SCREENW, SCREENH);;
//        
//        // self.navigationController.view.frame=CGRectMake(100, 0, SCREENW, SCREENH);
//        
//        a=1;
//    }
//    else
//    {
//        // self.navigationController.view.frame=CGRectMake(0, 0, SCREENW, SCREENH);
//        transitionView.frame=CGRectMake(0, 0, SCREENW, SCREENH);;
//        self.tabBarController.view.frame=CGRectMake(0, 0, SCREENW, SCREENH);
//        a=0;
//    }
//    
//}
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
