//
//  SSMainViewController.m
//  RobotControl
//
//  Created by apple on 17/1/11.
//  Copyright © 2017年 ss. All rights reserved.
//

#import "SSMainViewController.h"
#import "SSFunctionViewController.h"
#import "SSInformationViewController.h"
#import "AppDelegate.h"
#import "SSHomePageViewController.h"

@interface SSMainViewController ()<UIGestureRecognizerDelegate>
{
    int a;
}
@end

@implementation SSMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //    self.tabBar.backgroundImage=[UIImage imageNamed:@"navbar"];
    [[UITabBar appearance] setBarTintColor:THEMECOLOR];
    self.tabBar.tintColor=[UIColor whiteColor];
    
    
    SSHomePageViewController * fun=[[SSHomePageViewController alloc]init];
    UINavigationController * navc1=[[UINavigationController alloc]initWithRootViewController:fun];
    
    SSInformationViewController * info=[[SSInformationViewController alloc]init];
    UINavigationController * navc2=[[UINavigationController alloc]initWithRootViewController:info];
    
    self.viewControllers=@[navc1,navc2];
    
    UIView * panview=[[UIView alloc]initWithFrame:CGRectMake(0, 64, 5, SCREENH-64)];
    [self.view addSubview:panview];
    
    
    UIScreenEdgePanGestureRecognizer * screenEdgePan=[[UIScreenEdgePanGestureRecognizer alloc]initWithTarget:self action:@selector(leftslid:)];
    screenEdgePan.edges = UIRectEdgeLeft;
    [self.view addGestureRecognizer:screenEdgePan];
    
    UIScreenEdgePanGestureRecognizer * screenEdgePan2=[[UIScreenEdgePanGestureRecognizer alloc]initWithTarget:self action:@selector(rightslid:)];
    screenEdgePan2.edges = UIRectEdgeRight;
    [self.view addGestureRecognizer:screenEdgePan2];
    
    UIPanGestureRecognizer * leftgesture=[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(leftswipe:)];
    //    leftgesture.direction=UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:leftgesture];
    
    [leftgesture requireGestureRecognizerToFail:screenEdgePan];  //设置优先级（拖移手势优先级高于拍击手势）
    a=0;
    
    
    NSArray * array=self.viewControllers;
    NSArray * nameArray=@[@"首页",@"消息"];
    NSArray * imagrArray = @[@"main_home_normal",@"main_message_normal"];
    NSArray * selectArray=@[@"main_home_select",@"main_message_select"];
    for (int i=0; i<array.count; i++) {
        UIViewController * view=array[i];
        view.tabBarItem=[[UITabBarItem alloc]initWithTitle:nameArray[i] image:[UIImage imageNamed:imagrArray[i]] selectedImage:[UIImage imageNamed:selectArray[i]]];
        //  view.tabBarItem.badgeValue=[NSString stringWithFormat:@"%d",1];
    }
    
    
    
    //    id target = self.navigationController.interactivePopGestureRecognizer.delegate;
    //
    //    // handleNavigationTransition:为系统私有API,即系统自带侧滑手势的回调方法，我们在自己的手势上直接用它的回调方法
    //    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:target action:@selector(leftslid)];
    //    panGesture.delegate = self; // 设置手势代理，拦截手势触发
    //    [self.view addGestureRecognizer:panGesture];
    
    // 一定要禁止系统自带的滑动手势
    //    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    
}

// 什么时候调用，每次触发手势之前都会询问下代理方法，是否触发
// 作用：拦截手势触发
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    //    // 当当前控制器是根控制器时，不可以侧滑返回，所以不能使其触发手势
    //    if(self.navigationController.childViewControllers.count == 1)
    //    {
    //        return NO;
    //    }
    
    return YES;
}
-(void)leftswipe:( UIPanGestureRecognizer * )sender{
    AppDelegate * delega=(AppDelegate *)[UIApplication sharedApplication].delegate;
    UIView * transitionView=[delega.window.subviews objectAtIndex:1];
    
    CGPoint point = [sender translationInView:self.view];
    
    if (point.x<0&&transitionView.frame.origin.x>0) {
        
        
        switch (sender.state) {
            case UIGestureRecognizerStateBegan:
                NSLog(@"手势开始");
                break;
            case UIGestureRecognizerStateChanged:
                NSLog(@"手势进行中");
                CGPoint point = [sender translationInView:self.view];
                NSLog(@"=%f",-point.x );
                if (-point.x>SCREENW-70) {
                    transitionView.frame=CGRectMake(0, 0, SCREENW, SCREENH);;
                     delega.slidView.shadowView.alpha=1;
                    break;
                }
                //                if (-point.x<70) {
                //                     transitionView.frame=CGRectMake(SCREENW-70, 0, SCREENW, SCREENH);;
                //                }
                //                else
                transitionView.frame=CGRectMake(SCREENW+point.x-70, 0, SCREENW, SCREENH);;
                delega.slidView.shadowView.alpha=1-(SCREENW+point.x-70)/(CGFloat)SCREENW;
                break;
            case UIGestureRecognizerStateEnded:
                NSLog(@"手势结束");
                CGPoint point2 = [sender translationInView:self.view];
                NSLog(@"=%f",-point2.x );
                if (-point2.x>100) {
                    transitionView.frame=CGRectMake(0, 0, SCREENW, SCREENH);;
                    delega.slidView.shadowView.alpha=1;
                }
                else
                { transitionView.frame=CGRectMake(SCREENW-70, 0, SCREENW, SCREENH);;
                   delega.slidView.shadowView.alpha=0;
                }
                break;
                
            default:
                break;
        }
        
//        NSLog(@"滑动中");
//        
//        NSLog(@"=%f",point.x );
//        
//        if (-point.x>SCREENW-70) {
//            transitionView.frame=CGRectMake(0, 0, SCREENW, SCREENH);;
//            
//        }
//        //                if (-point.x<70) {
//        //                     transitionView.frame=CGRectMake(SCREENW-70, 0, SCREENW, SCREENH);;
//        //
//        else
//            transitionView.frame=CGRectMake(SCREENW+point.x-70, 0, SCREENW, SCREENH);;
    }
    
}
-(void)rightslid: (UIScreenEdgePanGestureRecognizer*)sender{
    AppDelegate * delega=(AppDelegate *)[UIApplication sharedApplication].delegate;
    UIView * transitionView=[delega.window.subviews objectAtIndex:1];
    
    if (sender.edges == UIRectEdgeRight) {
        NSLog(@"正在从右边滑动");
        switch (sender.state) {
            case UIGestureRecognizerStateBegan:
                NSLog(@"手势开始");
                break;
            case UIGestureRecognizerStateChanged:
                NSLog(@"手势进行中");
                CGPoint point = [sender translationInView:self.view];
                NSLog(@"=%f",-point.x );
                if (-point.x>SCREENW-70) {
                    transitionView.frame=CGRectMake(0, 0, SCREENW, SCREENH);;
                    delega.slidView.shadowView.alpha=1;
                    break;
                }
                //                if (-point.x<70) {
                //                     transitionView.frame=CGRectMake(SCREENW-70, 0, SCREENW, SCREENH);;
                //                }
                //                else
                transitionView.frame=CGRectMake(SCREENW+point.x-70, 0, SCREENW, SCREENH);;
                delega.slidView.shadowView.alpha=(SCREENW+point.x-70)/(CGFloat)SCREENW;
                break;
            case UIGestureRecognizerStateEnded:
                NSLog(@"手势结束");
                CGPoint point2 = [sender translationInView:self.view];
                NSLog(@"=%f",-point2.x );
                if (-point2.x>100) {
                    transitionView.frame=CGRectMake(0, 0, SCREENW, SCREENH);;
                    delega.slidView.shadowView.alpha=1;
                }
                else
                {  transitionView.frame=CGRectMake(SCREENW-70, 0, SCREENW, SCREENH);;
                    delega.slidView.shadowView.alpha=0;
                }
                break;
                
            default:
                break;
        }
    }
    
    
}

-(void)leftslid: (UIScreenEdgePanGestureRecognizer*)sender
{
    //向右展示左侧view
    
    NSLog(@"SCREENW===%f",SCREENW);
    AppDelegate * delega=(AppDelegate *)[UIApplication sharedApplication].delegate;
    UIView * transitionView=[delega.window.subviews objectAtIndex:1];
    
    if (sender.edges == UIRectEdgeLeft) {
        NSLog(@"正在从左边滑动");
        switch (sender.state) {
            case UIGestureRecognizerStateBegan:
                NSLog(@"手势开始");
                break;
            case UIGestureRecognizerStateChanged:
                NSLog(@"手势进行中");
                CGPoint point = [sender translationInView:self.view];
                NSLog(@"=%f",point.x );
                if (point.x>SCREENW-70) {
                    transitionView.frame=CGRectMake(SCREENW-70, 0, SCREENW, SCREENH);;
                    delega.slidView.shadowView.alpha=0;
                    break;
                }
                transitionView.frame=CGRectMake(point.x, 0, SCREENW, SCREENH);;
                delega.slidView.shadowView.alpha=1-(point.x)/(CGFloat)SCREENW;
                break;
            case UIGestureRecognizerStateEnded:
                NSLog(@"手势结束");
                CGPoint point2 = [sender translationInView:self.view];
                NSLog(@"=%f",point2.x );
                if (point2.x>100) {
                    transitionView.frame=CGRectMake(SCREENW-70, 0, SCREENW, SCREENH);;
                    delega.slidView.shadowView.alpha=0;
                }
                else
                {
                 transitionView.frame=CGRectMake(0, 0, SCREENW, SCREENH);;
                 delega.slidView.shadowView.alpha=1;
                }
                break;
                
            default:
                break;
        }
        
    }
    
    CGPoint point = [sender translationInView:self.view];
    //    NSLog(@"=%f =%f",point.x ,point.y);
    //    CGFloat process = [sender translationInView:self.view].x/self.view.bounds.size.width;
    //    process = MIN(1.0, MAX(0.0, process));
    //   // NSLog(@"%f",process);
    //    CGFloat process2 = self.view.bounds.size.width/[sender translationInView:self.view].x;
    //   //NSLog(@"%f",process2);
    //
    //    AppDelegate * delega=(AppDelegate *)[UIApplication sharedApplication].delegate;
    //    UIView * transitionView=[delega.window.subviews objectAtIndex:1];
    //  transitionView.frame=CGRectMake(100, 0, SCREENW, SCREENH);;
    //UIView * transitionView = [[delega.view subviews] objectAtIndex:0];
    //    if (point.x> 0) {
    //        //self.tabBarController.view.frame=CGRectMake(100, 0, SCREENW, SCREENH);
    //        transitionView.frame=CGRectMake(SCREENW-70, 0, SCREENW, SCREENH);;
    //
    //        // self.navigationController.view.frame=CGRectMake(100, 0, SCREENW, SCREENH);
    //
    //
    //        a=1;
    //    }
    //    else
    //    {
    //        // self.navigationController.view.frame=CGRectMake(0, 0, SCREENW, SCREENH);
    //        transitionView.frame=CGRectMake(0, 0, SCREENW, SCREENH);;
    //        self.tabBarController.view.frame=CGRectMake(0, 0, SCREENW, SCREENH);
    //
    //        a=0;
    //    }
    
    
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    NSLog(@"Began");
    
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    NSLog(@"end");

}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
   // NSLog(@"moving");
    
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
