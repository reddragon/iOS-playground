//
//  SettingsViewController.m
//  FacebookDemo
//
//  Created by Gaurav Menghani on 10/22/14.
//  Copyright (c) 2014 Timothy Lee. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSMutableArray *cells;

@property (strong, nonatomic) NSArray *names;

@property (strong, nonatomic) NSMutableString *selectedOption;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // navigation buttons
    
    // Configure the right button
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Apply" style:UIBarButtonItemStylePlain target:self action:@selector(onApplyButton)];
    
    self.navigationItem.rightBarButtonItem = rightButton;
    
    // Configure the left button
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"Close" style:UIBarButtonItemStylePlain target:self action:@selector(onCloseButton)];
    
    self.navigationItem.leftBarButtonItem = leftButton;
    
    // Configure the title
    self.navigationItem.title = @"Settings";
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"SettingsCell" bundle:nil] forCellReuseIdentifier:@"SettingsCell"];
    
    self.cells = [[NSMutableArray alloc] initWithCapacity:4];
    
    self.names = [[NSArray alloc] initWithObjects:@"Movies", @"Home Feed", @"Photos", @"Books", nil];
}

-(void) onApplyButton {
    NSLog(@"Apply called");
}


-(void) onCloseButton {
    NSLog(@"Close called");
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SettingsCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"SettingsCell"];
    
    cell.name.text = self.names[indexPath.row];
    cell.vc = self;
    
    [self.cells addObject:cell];
    
    for (SettingsCell *cell in self.cells) {
        NSLog(@"Label for cell is %@", cell.name.text);
    }
    
    return cell;
}

- (void) switchToggled {
    NSLog(@"Called");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) selectCell:(SettingsCell *)cell {
    NSLog(@"Called %@", cell.name.text);
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
