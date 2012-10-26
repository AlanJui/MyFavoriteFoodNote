//
//  UpdateViewController.h
//  MyFavoriteFoodNote
//
//  Created by 居正中 on 12/10/8.
//  Copyright (c) 2012年 CCC Studio. All rights reserved.
//

#import "MyAppUtility.h"

@interface UpdateViewController : UIViewController <UITextFieldDelegate, UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *noteDate;
@property (weak, nonatomic) IBOutlet UITextField *titleName;
@property (weak, nonatomic) IBOutlet UITextView *introduction;
@property (weak, nonatomic) IBOutlet UIImageView *photo;
@property (weak, nonatomic) IBOutlet UITextField *storeName;
@property (weak, nonatomic) IBOutlet UITextField *address;

@end
