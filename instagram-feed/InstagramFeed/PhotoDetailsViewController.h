//
//  PhotoDetailsViewController.h
//  InstagramFeed
//
//  Created by Gaurav Menghani on 10/15/14.
//  Copyright (c) 2014 Gaurav Menghani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoViewCell.h"

@interface PhotoDetailsViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) NSDictionary *dictonary;
@property (weak, nonatomic) PhotoViewCell *photo;
@end
