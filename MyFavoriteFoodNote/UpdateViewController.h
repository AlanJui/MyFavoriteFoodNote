//
//  UpdateViewController.h
//  MyFavoriteFoodNote
//
//  Created by 居正中 on 12/10/8.
//  Copyright (c) 2012年 CCC Studio. All rights reserved.
//

#import "CreateViewController.h"

@interface UpdateViewController : CreateViewController

@property (strong, nonatomic)id detailItem;
@property (weak, nonatomic) IBOutlet UITextField *noteDate;
@property (weak, nonatomic) IBOutlet UITextField *notName;
@property (weak, nonatomic) IBOutlet UITextField *restName;
@property (weak, nonatomic) IBOutlet UITextView *introduction;
@property (weak, nonatomic) IBOutlet UITextField *address;

@end
