//
//  ImagePickerController.h
//  SnappyCam
//
//  Created by Gaurav Menghani on 12/16/14.
//  Copyright (c) 2014 Foo Bar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImagePickerController : UIImagePickerController
// We need a singleton, because if you always instantiate a Camera, it will
// show up a black screen.
+ (ImagePickerController*)imagePicker;
@end
