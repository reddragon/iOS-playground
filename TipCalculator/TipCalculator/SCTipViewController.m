//
//  SCTipViewController.m
//  TipCalculator
//
//  Created by Gaurav Menghani on 10/4/14.
//  Copyright (c) 2014 Gaurav Menghani. All rights reserved.
//

#import "SCTipViewController.h"
#import "SCSettingsViewController.h"

@interface SCTipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;

- (IBAction)onTap:(id)sender;
- (void)updateTipValue;
- (void)onSettingsButton;
- (void)setDefaultTip;

@end

@implementation SCTipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Tip Calculator";
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"The view loaded");
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];
    [self setDefaultTip];
}

- (void)viewWillAppear:(BOOL)animated {
    [self setDefaultTip];
}

- (void)setDefaultTip
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int selectedIndex = [defaults integerForKey:@"tip_index"];
    NSLog(@"Value read was: %d", selectedIndex);
    [_tipControl setSelectedSegmentIndex:selectedIndex];
}

- (void)onSettingsButton
{
    NSLog(@"Clicked");
    [self.navigationController pushViewController:[[SCSettingsViewController alloc] init] animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateTipValue];
}

- (void)updateTipValue {
    NSArray *tipValues = @[@(0.1), @(0.15), @(0.2)];
    float multiplier = [tipValues[[_tipControl selectedSegmentIndex]] floatValue];
    float bill = [_billTextField.text floatValue];
    float tip = bill * multiplier;
    float total = bill + tip;
    [_tipLabel setText:[NSString stringWithFormat:@"$%.02f", tip]];
    [_totalLabel setText:[NSString stringWithFormat:@"$%.02f", total]];
    
}
@end
