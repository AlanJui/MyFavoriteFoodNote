//
//  CreateViewController.h
//  MyFavoriteFoodNote
//
//  Created by 居正中 on 12/10/8.
//  Copyright (c) 2012年 CCC Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "TakePhotoViewController.h"
#import "MyAppUtility.h"

@interface CreateViewController : UIViewController <UITextFieldDelegate>
{
    @private
    BOOL keyboardIsShown;
}

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UILabel *noteDate;
@property (weak, nonatomic) IBOutlet UITextField *titleName;
@property (weak, nonatomic) IBOutlet UITextView *introduction;
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet UITextField *storeName;
@property (weak, nonatomic) IBOutlet UITextField *address;

@property (strong, nonatomic) UIImage *photoImage;
@property UIToolbar *tb;

- (IBAction)saveButtonPressed:(id)sender;
- (IBAction)takePhotoButtonPressed:(id)sender;

@end
