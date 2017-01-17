//
//  SSRegistMemberViewController.m
//  RobotControl
//
//  Created by apple on 17/1/12.
//  Copyright © 2017年 ss. All rights reserved.
//

#import "SSRegistMemberViewController.h"

@interface SSRegistMemberViewController ()<UITextFieldDelegate>

@end

@implementation SSRegistMemberViewController

-(void)viewDidAppear:(BOOL)animated{

    [super viewDidAppear:animated];
    [self createNavcBar];

}

-(void)createNavcBar{
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbar"] forBarMetrics:UIBarMetricsDefault];
    UILabel * lable=[[UILabel alloc]initWithFrame:CGRectMake(SCREENW/2-40, 5, 80, 35)];
    lable.backgroundColor=[UIColor clearColor];
    lable.text=@"注册";
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
    
    
    _username.delegate=self;
    _username.returnKeyType=UIReturnKeyDone;
    
    _password.delegate=self;
    _password.returnKeyType=UIReturnKeyDone;

    _confirmPassword.delegate=self;
    _confirmPassword.returnKeyType=UIReturnKeyDone;

    _telephone.delegate=self;
    _telephone.returnKeyType=UIReturnKeyDone;

    _nickname.delegate=self;
    _nickname.returnKeyType=UIReturnKeyDone;

    _address.delegate=self;
    _address.returnKeyType=UIReturnKeyDone;

    
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField;           // became first responder
{

    if ((SCREENH-textField.frame.origin.y-216-70)<0) {
        _usernametopSpace.constant=_usernametopSpace.constant+(SCREENH-textField.frame.origin.y-216-70)-40;
    }


}
-(void)textFieldDidEndEditing:(UITextField *)textField{

    _usernametopSpace.constant=80;


}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
//    _logimgconstraint.constant=40;
    _usernametopSpace.constant=80;

    [self.view endEditing:YES];
    return YES;
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

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
