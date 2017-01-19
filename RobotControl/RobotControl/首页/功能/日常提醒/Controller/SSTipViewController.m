//
//  SSTipViewController.m
//  RobotControl
//
//  Created by apple on 17/1/16.
//  Copyright © 2017年 ss. All rights reserved.
//

#import "SSTipViewController.h"
#import "SSTipTableViewCell.h"
#import "SSAddTipView.h"
#import "AppDelegate.h"

@interface SSTipViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView * tableview;
@property (nonatomic,strong)SSAddTipView * tipview;
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
    
    UIButton * rightButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 10, 40, 40)];
    [rightButton addTarget:self action:@selector(addtip) forControlEvents:UIControlEventTouchUpInside];
    rightButton.titleLabel.font=[UIFont systemFontOfSize:17];
    [rightButton setTitle:@"添加" forState:UIControlStateNormal];
    UIBarButtonItem * rightitem=[[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem=rightitem;

    
    
    
}
-(void)addtip{
    AppDelegate * delegate=(AppDelegate *)[UIApplication sharedApplication].delegate;
    
   _tipview=[[SSAddTipView alloc]initWithFrame:CGRectMake(0, 0, SCREENW, SCREENH)];
//    _tipview.backgroundColor=[UIColor blueColor];
    
    
//    NSArray* nibView = [[NSBundle mainBundle] loadNibNamed:@"SSAddTipView" owner:nil options:nil];
//    _tipview = [nibView firstObject];
//    _tipview.backgroundColor=[UIColor blueColor];
//    _tipview.frame=CGRectMake(0, 0, SCREENW, SCREENH);
//    [self.view addSubview:_tipview];
    [delegate.window addSubview:_tipview];


}
-(void)back{
    [self.navigationController popViewControllerAnimated:NO];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self createUI];
}
-(void)createUI{

    _tableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREENW, SCREENH) style:UITableViewStylePlain];
    _tableview.dataSource=self;
    _tableview.delegate=self;
  //  [_tableview registerNib:[UINib nibWithNibName:@"SSTipTableViewCell" bundle:nil] forCellReuseIdentifier:@"SSTipTableViewCell"];
    [self.view addSubview:_tableview];


}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{

    return 1;

}
// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    UITableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:@"SSTipTableViewCell"];
    if (!cell) {
        cell=[[[UINib nibWithNibName:@"SSTipTableViewCell" bundle:nil] instantiateWithOwner:self options:nil]lastObject];
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;

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
