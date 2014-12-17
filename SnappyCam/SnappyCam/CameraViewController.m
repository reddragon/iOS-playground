//
//  CameraViewController.m
//  SnappyCam
//
//  Created by Gaurav Menghani on 12/16/14.
//  Copyright (c) 2014 Foo Bar. All rights reserved.
//

#import "CameraViewController.h"
#import "ImagePickerController.h"

@interface CameraViewController ()
- (IBAction)onCameraButtonPush:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *cameraImg;

@end

@implementation CameraViewController

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    NSLog(@"Finished picking!");
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    UIImage* image = [info objectForKey:UIImagePickerControllerOriginalImage];
    self.cameraImg.image = image;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

- (IBAction)onCameraButtonPush:(id)sender {
    ImagePickerController *imagePicker = [ImagePickerController imagePicker];
    imagePicker.delegate = self;
    [self.navigationController presentViewController:imagePicker animated:YES completion:nil];
}
@end
