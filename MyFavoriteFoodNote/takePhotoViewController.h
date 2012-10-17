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
}

@property (strong, nonatomic) id caller;
@property (nonatomic, strong) UIImagePickerController *imagePicker;

@property (nonatomic, weak) IBOutlet UIImageView *photoImageView;
- (IBAction)returnButtonTapped:(id)sender;

@end
