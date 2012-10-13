//
//  takePhotoViewController.m
//  MyFavoriteFoodNote
//
//  Created by 居正中 on 12/10/8.
//  Copyright (c) 2012年 CCC Studio. All rights reserved.
//

#import "TakePhotoViewController.h"

@interface TakePhotoViewController ()

@end

@implementation TakePhotoViewController
@synthesize imagePicker;
@synthesize photoImageView;

/***********
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*************/

- (void)viewWillAppear:(BOOL)animated
{
/***
    if (self.photoImageView != nil) {
        self.photoImageView.image = [UIImage imageWithData:self.photoImage];
    }
***/ 
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    // Check if camera is available
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] == NO) {
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:nil message:@"此裝置不提供拍攝相片功能。" delegate:nil
                                  cancelButtonTitle:@"確定"
                                  otherButtonTitles:nil];
        [alertView show];
        return;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)takePhoto:(id)sender
{
    self.imagePicker = [[UIImagePickerController alloc] init];
    
    // 設定 SourceType
    self.imagePicker.delegate = self;
    self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    self.imagePicker.showsCameraControls = YES;
    //self.imagePicker.allowsEditing = YES;
    
    self.imagePicker.mediaTypes = [NSArray arrayWithObjects:@"public.image", @"public.movie", nil];
    
    // 啟動相機
    [self presentViewController:imagePicker animated:YES completion:nil];
}

#pragma mark - UIImagePickerControllerDelegate Methods

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSLog(@"Info: %@", [info description]);
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    if ([mediaType isEqualToString:@"public.image"]) {
/*****
        // 取得裁切前的原圖 (OverlayView 一定得使用這種方法取得圖片)
        UIImage *resultImage = [info objectForKey:UIImagePickerControllerOriginalImage];
        
        // 取得裁切後的圖片
        UIImage *resultImage = [info objectForKey:UIImagePickerControllerEditedImage];
        //[photoImageView setImage:resultImage];
        // Save image to Album
        UIImageWriteToSavedPhotosAlbum(resultImage, self, @selector(image:didFinishSavingWithError:conextInfo:), nil);
*****/
        // 取得裁切前的原圖 (OverlayView 一定得使用這種方法取得圖片)
        UIImage *resultImage = [info objectForKey:UIImagePickerControllerOriginalImage];
        
        // 取得合成以後的圖片
        UIImage *modifiedImage = [self modifyWithSourceImage:resultImage];
        [photoImageView setImage:modifiedImage];
        
        // Save image to Album
        UIImageWriteToSavedPhotosAlbum(modifiedImage, self, @selector(image:didFinishSavingWithError:conextInfo:), nil);
        
        self.photoImageView.image = modifiedImage;
        
        CreateViewController *parentViewController = self.caller;
        parentViewController.photoImage = modifiedImage;
        
    } else {
        NSString *tempFilePath = [[info objectForKey:UIImagePickerControllerMediaURL] path];
        NSLog(@"Video at: %@", tempFilePath);
        
        if (UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(tempFilePath)) {
            UISaveVideoAtPathToSavedPhotosAlbum(tempFilePath, self, @selector(video:didFinishSavingWithError:contextInfo:), nil);
        }
    }
    
    //[picker dismissModalViewControllerAnimated:YES];
    self.imagePicker = nil;
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


// 圖片存檔完成後的通知
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error conextInfo:(NSDictionary *)info
{
    UIAlertView *alertView =
        [[UIAlertView alloc] initWithTitle:nil
                                   message:@"拍攝的相片，已存入相簿之中。"
                                  delegate:nil
                         cancelButtonTitle:@"OK"
                         otherButtonTitles:nil];
    [alertView show];
}

// 回傳合成後的圖片檔
- (UIImage *)modifyWithSourceImage:(UIImage *)sourceImage
{
    // 要求系統給予虛擬畫布
    CGSize targetSize = CGSizeMake(300, 300);
    UIGraphicsBeginImageContext(targetSize);
    
    // 將原始圖片，畫入虛擬畫布中
    [sourceImage drawInRect:CGRectMake(0, 0, targetSize.width, targetSize.height)];
    
    // 將畫框圖片，畫入虛擬畫布中（原始圖片與畫框合成）
    UIImage *frameImage = [UIImage imageNamed:@"frame_01.png"];
    [frameImage drawInRect:CGRectMake(0, 0, targetSize.width, targetSize.height)];
    
    // 畫入文字
    //    NSString *textString = @"午安～！";
    //    UIFont *font = [UIFont systemFontOfSize:60];
    NSString *textString = @"Happy!!";
    UIFont *font = [UIFont fontWithName:@"Bradley Hand" size:60];
    
    UIColor *textColor = [UIColor redColor];
    [textColor set];
    [textString drawAtPoint:CGPointMake(15, 20) withFont:font];
    
    // 自虛擬畫布，讀出最後的圖片
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();    // 此方法若缺少，將致系統發生 Memory Leak
    
    return result;
}

- (void)video:(NSString *)videoPath didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    UIAlertView *alertView =
    [[UIAlertView alloc] initWithTitle:nil
                               message:@"Movie saved to Album."
                              delegate:nil
                     cancelButtonTitle:@"OK"
                     otherButtonTitles:nil];
    [alertView show];
    [[NSFileManager defaultManager] removeItemAtPath:videoPath error:nil];
}

- (IBAction)doneButtonPressed:(id)sender
{
    //[self.navigationController popViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
