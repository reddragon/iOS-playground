//
//  SettingsCell.h
//  FacebookDemo
//
//  Created by Gaurav Menghani on 10/22/14.
//  Copyright (c) 2014 Timothy Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingsViewController.h" 

@interface SettingsCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UISwitch *onOffSwitch;

@property (weak, nonatomic) SettingsViewController *vc;

@end
