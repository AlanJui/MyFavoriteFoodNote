//
//  UpdateViewController.h
//  MyFavoriteFoodNote
//
//  Created by 居正中 on 12/10/8.
//  Copyright (c) 2012年 CCC Studio. All rights reserved.
//

#import "CreateViewController.h"
#import "MyAppUtility.h"

@interface UpdateViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) id detailItem;
@property (strong, nonatomic) UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITextField *noteDate;
@property (weak, nonatomic) IBOutlet UITextField *notName;
@property (weak, nonatomic) IBOutlet UITextField *restName;
@property (weak, nonatomic) IBOutlet UITextView *introduction;
@property (weak, nonatomic) IBOutlet UIImageView *photo;
@property (weak, nonatomic) IBOutlet UITextField *address;

@end
