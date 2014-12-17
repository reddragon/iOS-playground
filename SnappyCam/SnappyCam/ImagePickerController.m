//
//  ImagePickerController.m
//  SnappyCam
//
//  Created by Gaurav Menghani on 12/16/14.
//  Copyright (c) 2014 Foo Bar. All rights reserved.
//

#import "ImagePickerController.h"

@interface ImagePickerController ()
@end

@implementation ImagePickerController
static ImagePickerController* _imagePicker;

+ (ImagePickerController*)imagePicker {
    if (!_imagePicker) {
        _imagePicker = [[ImagePickerController alloc] init];
        _imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    return _imagePicker;
}

- (id)initForUse {
    self.sourceType = UIImagePickerControllerSourceTypeCamera;
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

@end
