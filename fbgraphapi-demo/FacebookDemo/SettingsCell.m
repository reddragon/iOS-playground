//
//  SettingsCell.m
//  FacebookDemo
//
//  Created by Gaurav Menghani on 10/22/14.
//  Copyright (c) 2014 Timothy Lee. All rights reserved.
//

#import "SettingsCell.h"

@implementation SettingsCell

- (void)awakeFromNib {
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.onOffSwitch addTarget:self action:@selector(switchToggled) forControlEvents:UIControlEventValueChanged];
}

-(void) switchToggled {
    [self.vc selectCell:self];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
