//
//  SSTipTableViewCell.m
//  RobotControl
//
//  Created by apple on 17/1/19.
//  Copyright © 2017年 ss. All rights reserved.
//

#import "SSTipTableViewCell.h"

@implementation SSTipTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (IBAction)TipisOn:(UISwitch *)sender {
    
    _model.isOn=sender.isOn;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
