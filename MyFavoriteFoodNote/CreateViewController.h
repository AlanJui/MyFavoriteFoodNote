//
//  CreateViewController.h
//  MyFavoriteFoodNote
//
//  Created by 居正中 on 12/10/8.
//  Copyright (c) 2012年 CCC Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CreateViewController.h"
#import "AppDelegate.h"
#import "TakePhotoViewController.h"

@interface CreateViewController : UIViewController <UITextFieldDelegate>
{
    @private
    BOOL keyboardIsShown;
}

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITextField *noteDate;
@property (weak, nonatomic) IBOutlet UITextField *restName;
@property (weak, nonatomic) IBOutlet UITextView *introduction;
@property (weak, nonatomic) IBOutlet UITextField *address;
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;

@property (strong, nonatomic) UIImage *photoImage;

- (IBAction)saveButtonPressed:(id)sender;
- (IBAction)takePhotoButtonPressed:(id)sender;
- (IBAction)doneButtonTapped:(id)sender;

@end
