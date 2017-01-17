//
//  SSLoginViewController.m
//  RobotControl
//
//  Created by apple on 17/1/12.
//  Copyright © 2017年 ss. All rights reserved.
//

#import "SSLoginViewController.h"
#import "SSMainViewController.h"
#import "SSRegistMemberViewController.h"

@interface SSLoginViewController ()<UITextFieldDelegate>

@end

@implementation SSLoginViewController


-(void)viewWillDisappear:(BOOL)animated{

    [super viewWillDisappear:animated];
    
    self.navigationController.navigationBar.hidden=NO;


}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=YES;
   
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.navigationController.navigationBar.hidden=YES;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _username.delegate=self;
    _password.delegate=self;
    _password.returnKeyType=UIReturnKeyDone;
    _username.returnKeyType=UIReturnKeyDone;
}



- (IBAction)remberpassword:(UIButton *)sender {
    
    sender.selected=!sender.selected;
    
}


- (IBAction)login:(UIButton *)sender {
    SSMainViewController * main=[[SSMainViewController alloc]init];
    [self presentViewController:main animated:NO completion:nil];
    
}

- (IBAction)registNewMember:(UIButton *)sender {
    SSRegistMemberViewController * regist=[[SSRegistMemberViewController alloc]init];
    [self.navigationController pushViewController:regist animated:NO];
    
}



- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    _logimgconstraint.constant=40;

    [self.view endEditing:YES];
    return YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{

    _logimgconstraint.constant=10;

}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
     _logimgconstraint.constant=40;
    [self.view endEditing:YES];
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
