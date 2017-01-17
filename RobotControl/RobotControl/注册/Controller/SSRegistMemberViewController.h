//
//  SSRegistMemberViewController.h
//  RobotControl
//
//  Created by apple on 17/1/12.
//  Copyright © 2017年 ss. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSRegistMemberViewController : UIViewController
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *usernametopSpace;
@property (strong, nonatomic) IBOutlet UITextField *username;
@property (strong, nonatomic) IBOutlet UITextField *password;
@property (strong, nonatomic) IBOutlet UITextField *confirmPassword;
@property (strong, nonatomic) IBOutlet UITextField *telephone;
@property (strong, nonatomic) IBOutlet UITextField *nickname;
@property (strong, nonatomic) IBOutlet UITextField *address;

@end
