//
//  DetailViewController.h
//  MyFavoriteFoodNote
//
//  Created by 居正中 on 12/10/7.
//  Copyright (c) 2012年 CCC Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UITextField *noteDate;
@property (weak, nonatomic) IBOutlet UITextField *restName;
@property (weak, nonatomic) IBOutlet UITextView *introduction;
@property (weak, nonatomic) IBOutlet UIImageView *photo;
@property (weak, nonatomic) IBOutlet UITextField *address;
//@property (weak, nonatomic) IBOutlet MKMapView *mapLocation;



@end
