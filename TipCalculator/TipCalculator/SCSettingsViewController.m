//
//  SCSettingsViewController.m
//  TipCalculator
//
//  Created by Gaurav Menghani on 10/7/14.
//  Copyright (c) 2014 Gaurav Menghani. All rights reserved.
//

#import "SCSettingsViewController.h"

@interface SCSettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipSelector;
- (IBAction)tipValueChanged:(id)sender;

@end

@implementation SCSettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int selectedIndex = [defaults integerForKey:@"tip_index"];
    NSLog(@"Value read was: %d", selectedIndex);
    [_tipSelector setSelectedSegmentIndex:selectedIndex];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tipValueChanged:(id)sender {
    // NSArray *tipValues = @[@(0.1), @(0.15), @(0.2)];
    // float multiplier = [tipValues[[_tipSelector selectedSegmentIndex]] floatValue];
    int selected = [_tipSelector selectedSegmentIndex];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:selected forKey:@"tip_index"];
    [defaults synchronize];
    NSLog(@"Saved %d!", selected);
}
@end
