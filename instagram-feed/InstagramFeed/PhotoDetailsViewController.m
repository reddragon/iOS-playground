//
//  PhotoDetailsViewController.m
//  InstagramFeed
//
//  Created by Gaurav Menghani on 10/15/14.
//  Copyright (c) 2014 Gaurav Menghani. All rights reserved.
//

#import "PhotoDetailsViewController.h"

@interface PhotoDetailsViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation PhotoDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 320;
    
    
    UINib *photoViewCellNib = [UINib nibWithNibName:@"PhotoViewCell" bundle:nil];
    
    [self.tableView registerNib:photoViewCellNib forCellReuseIdentifier:@"PhotoViewCell"];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"Calling numberOfRows");
    return 1;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Trying to load cell %lu", indexPath.row);
    NSLog(@"Trying to load cell %lu", indexPath.row);
    
    PhotoViewCell* pvc = [tableView dequeueReusableCellWithIdentifier:@"PhotoViewCell" forIndexPath:indexPath];
    
    NSString* urlStr = self.dictonary[@"images"][@"low_resolution"][@"url"];
    [pvc.photoView setImageWithURL:[NSURL URLWithString:urlStr]];
    NSLog(@"URL: %@", urlStr);
    // NSLog(@"ImageView: @", pvc);
    return pvc;

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
