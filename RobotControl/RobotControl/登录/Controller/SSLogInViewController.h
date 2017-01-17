//
//  SSLoginViewController.h
//  RobotControl
//
//  Created by apple on 17/1/12.
//  Copyright © 2017年 ss. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSLoginViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *logoimg;
@property (strong, nonatomic) IBOutlet UITextField *username;
@property (strong, nonatomic) IBOutlet UITextField *password;

@property (strong, nonatomic) IBOutlet UIButton *login;
@property (strong, nonatomic) IBOutlet UIButton *remeberpassword;

@property (strong, nonatomic) IBOutlet UIButton *registMember;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *logimgconstraint;

@end
