//
//  SSFamilyNumTableViewCell.h
//  RobotControl
//
//  Created by apple on 17/1/20.
//  Copyright © 2017年 ss. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSFamilyNumTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *headImg;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *numLabel;
@property (strong, nonatomic) IBOutlet UIButton *setButton;

@end
