//
//  CreateViewController.h
//  MyFavoriteFoodNote
//
//  Created by 居正中 on 12/10/8.
//  Copyright (c) 2012年 CCC Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateViewController : UIViewController
{
    BOOL keyboardIsShown;
}
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITextField *noteDate;
@property (weak, nonatomic) IBOutlet UITextField *restName;
@property (weak, nonatomic) IBOutlet UITextView *introduction;
@property (weak, nonatomic) IBOutlet UITextField *address;

- (IBAction)saveButtonPressed:(id)sender;
- (IBAction)takePhotoButtonPressed:(id)sender;

@end
