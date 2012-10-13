//
//  takePhotoViewController.h
//  MyFavoriteFoodNote
//
//  Created by 居正中 on 12/10/8.
//  Copyright (c) 2012年 CCC Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CreateViewController.h"

@interface TakePhotoViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    @private
//    UIImage *photoImage;
}

@property (strong, nonatomic) id caller;
@property (nonatomic, strong) UIImagePickerController *imagePicker;
@property (nonatomic, strong) UIImage *photoImage;

@property (nonatomic, weak) IBOutlet UIImageView *photoImageView;

@end
