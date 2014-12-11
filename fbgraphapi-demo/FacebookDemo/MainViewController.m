//
//  MainViewController.m
//  FacebookDemo
//
//  Created by Timothy Lee on 10/22/14.
//  Copyright (c) 2014 Timothy Lee. All rights reserved.
//

#import "MainViewController.h"
#import "NodeCell.h"
#import <FacebookSDK/FacebookSDK.h>
#import "SettingsViewController.h"

@interface MainViewController ()<UITableViewDataSource, UITableViewDelegate>

- (void)reload;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) SettingsViewController *settings;
@property (strong, nonatomic) UINavigationController *nvc;

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self reload];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"NodeCell" bundle:nil] forCellReuseIdentifier:@"NodeCell"];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    // navigation buttons
    
    // Configure the right button
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];

    self.navigationItem.rightBarButtonItem = rightButton;
    
    // Configure the title
    self.navigationItem.title = @"Title";
    
    // Initialize settings
    
    
    self.settings = [[SettingsViewController alloc] init];
    
    self.nvc = [[UINavigationController alloc] initWithRootViewController:self.settings];
    
}


- (void) onSettingsButton {
    NSLog(@"Settings button called");
    [self presentViewController:self.nvc animated:YES completion:nil];
}



- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NodeCell* nodeCell = [self.tableView dequeueReusableCellWithIdentifier:@"NodeCell"];
    return nodeCell;
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

#pragma mark - Private methods

- (void)reload {
    [FBRequestConnection startWithGraphPath:@"/me/home"
                                 parameters:nil
                                 HTTPMethod:@"GET"
                          completionHandler:^(
                                              FBRequestConnection *connection,
                                              id result,
                                              NSError *error
                                              ) {
                              /* handle the result */
                              NSLog(@"result: %@", result);
                          }];
}

@end
