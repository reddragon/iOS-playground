//
//  PhotosViewController.m
//  InstagramFeed
//
//  Created by Gaurav Menghani on 10/15/14.
//  Copyright (c) 2014 Gaurav Menghani. All rights reserved.
//

#import "PhotosViewController.h"
#import "PhotoViewCell.h"
#import "PhotoDetailsViewController.h"

NSString* const kURL = @"https://api.instagram.com/v1/media/popular?client_id=3ddd0ffa65634de3892f68fad9581686";

@interface PhotosViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@property (strong, nonatomic) NSDictionary *response;
@property (strong, nonatomic) NSArray* data;
@property (weak, nonatomic) IBOutlet UITableView *photosTableView;
@property (nonatomic, strong) UIRefreshControl *refreshControl;


@end

@implementation PhotosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.photosTableView.delegate = self;
    self.photosTableView.dataSource = self;
    self.photosTableView.rowHeight = 320;
    
    UINib *photoViewCellNib = [UINib nibWithNibName:@"PhotoViewCell" bundle:nil];
    [self.photosTableView registerNib:photoViewCellNib forCellReuseIdentifier:@"PhotoViewCell"];
    
    // Refresh Control
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(onRefresh) forControlEvents:UIControlEventValueChanged];
    [self.photosTableView insertSubview:self.refreshControl atIndex:0];

    
    NSURL *url = [NSURL URLWithString:kURL];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        self.response = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        // NSLog(@"response: %@", self.response);
        self.data = self.response[@"data"];
        NSLog(@"Number of elements: %lu", self.data.count);
        [self.photosTableView reloadData];
        
    }];
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)onRefresh {
    NSLog(@"onRefresh CALLED!");
    NSURL *url = [NSURL URLWithString:kURL];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSLog(@"REFRESH CALLED!");
        // Set dictionary
        self.response = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        // NSLog(@"response: %@", self.response);
        self.data = self.response[@"data"];
        NSLog(@"Number of elements: %lu", self.data.count);
        [self.photosTableView reloadData];
        
        [self.refreshControl endRefreshing];
    }];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"Calling numberOfRows");
    return self.data.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Trying to load cell %lu", indexPath.row);
    
    PhotoViewCell* pvc = [tableView dequeueReusableCellWithIdentifier:@"PhotoViewCell" forIndexPath:indexPath];
    
    NSDictionary* dictionary = [self.data objectAtIndex:indexPath.row];
    NSString* urlStr = dictionary[@"images"][@"low_resolution"][@"url"];
    [pvc.photoView setImageWithURL:[NSURL URLWithString:urlStr]];
    NSLog(@"URL: %@", urlStr);
    // NSLog(@"ImageView: @", pvc);
    
    if (indexPath.row == self.data.count - 1) {
        NSLog(@"onRefresh CALLED!");
        NSURL *url = [NSURL URLWithString:kURL];
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            NSLog(@"REFRESH CALLED!");
            // Set dictionary
            self.response = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            
            // NSLog(@"response: %@", self.response);
            self.data = self.data.accessibilityActivate self.response[@"data"];
            NSLog(@"Number of elements: %lu", self.data.count);
            [self.photosTableView reloadData];
            
            [self.refreshControl endRefreshing];
        }];
   
    }
    
    return pvc;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    PhotoDetailsViewController *detailsView = [[PhotoDetailsViewController alloc] init];
    detailsView.dictonary = [self.data objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:detailsView animated:YES];
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
