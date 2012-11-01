//
//  CreateViewController.m
//  MyFavoriteFoodNote
//
//  Created by 居正中 on 12/10/8.
//  Copyright (c) 2012年 CCC Studio. All rights reserved.
//

#import "CreateViewController.h"

#define BARBUTTON(TITLE, SELECTOR) [[UIBarButtonItem alloc] initWithTitle:TITLE style:UIBarButtonItemStylePlain target:self action:SELECTOR]

#define SYSBARBUTTON(ITEM, SELECTOR) [[UIBarButtonItem alloc] initWithBarButtonSystemItem:ITEM target:self action:SELECTOR]

#define COOKBOOK_PURPLE_COLOR [UIColor colorWithRed:0.20392f green:0.19607f blue:0.61176f alpha:1.0f]


@interface CreateViewController ()


@end

@implementation CreateViewController
@synthesize photoImage;
@synthesize scrollView;
@synthesize tb;
@synthesize introduction;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) loadView
{
    
    [super loadView];
    
    [self initTextFieldKeyPadHandler];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
	self.navigationController.navigationBar.tintColor = COOKBOOK_PURPLE_COLOR;
    introduction.inputAccessoryView = [self accessoryView];
    
    /******
     [[NSNotificationCenter defaultCenter] addObserver:self
     selector:@selector(keyboardWillHide:)
     name:UIKeyboardWillHideNotification
     object:nil];
     
     [[NSNotificationCenter defaultCenter] addObserver:self
     selector:@selector(adjustForKeyboard:)
     name:UIKeyboardDidShowNotification
     object:nil];
     *****/
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
   
}

- (void) viewWillAppear:(BOOL)animated
{
/*****
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardIsShown:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardIsHidden:)
                                                 name:UIKeyboardDidHideNotification
                                               object:nil];
*****/    
    self.noteDate.text = [MyAppUtility convertDateToString:[NSDate date]];
    if (self.photoImage != nil) {
        self.photoImageView.image = self.photoImage;
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
/*****
    NSLog(@"Unregistering for keyboard events");
    [[NSNotificationCenter defaultCenter] removeObserver:self];
 *****/
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveButtonPressed:(id)sender {

    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = appDelegate.managedObjectContext;
    NSManagedObject *newManagedObject = [NSEntityDescription insertNewObjectForEntityForName:@"GoodNews" inManagedObjectContext:context];
/***********
    [newManagedObject setValue:[NSDate date] forKey:@"noteDate"];
    [newManagedObject setValue:@"愛家連鎖餐廳" forKey:@"restName"];
    [newManagedObject setValue:@"愛家為全球世界級的蔬食連鎖餐廳，提供美味好吃的餐飲，為環保救地球，盡一份力量。" forKey:@"introduction"];
    [newManagedObject setValue:@"新北市汐止區新台五路" forKey:@"address"];
 **********/
    
    //[newManagedObject setValue:noteDate.text forKey:@"noteDate"];
    [newManagedObject setValue:[NSDate date] forKey:@"noteDate"];
    [newManagedObject setValue:_titleName.text forKey:@"title"];
    [newManagedObject setValue:introduction.text forKey:@"introduction"];
    
    [newManagedObject setValue:_storeName.text forKey:@"storeName"];
    [newManagedObject setValue:_address.text forKey:@"address"];
    
    // Save the context.
    NSError *error = nil;
    if (![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    //[self dismissViewControllerAnimated:YES completion:^{NSLog(@"Back to parent view!");}];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)takePhotoButtonPressed:(id)sender {
    
//    [self performSegueWithIdentifier:@"takePhoto" sender:nil];
    
    TakePhotoViewController *takePhotoViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"TakePhotoView"];
    takePhotoViewController.caller = self;
    [self presentViewController:takePhotoViewController animated:YES completion:nil];
}

#pragma mark - Keyboard Handdling

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)keyboardIsShown:(NSNotification *) notify
{
    if (keyboardIsShown) {
        return;
    }
    keyboardIsShown = YES;
    
    NSDictionary *info = [notify userInfo];
    CGSize keyboardSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    CGRect newRectFrame = self.scrollView.frame;
    newRectFrame.size.height -= keyboardSize.height;
    self.scrollView.frame = newRectFrame;
}

- (void)keyboardIsHidden:(NSNotification *) notify
{
    if (keyboardIsShown) {
        return;
    }
    keyboardIsShown = NO;
    
    NSDictionary *info = [notify userInfo];
    CGSize keyboardSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    CGRect newRectFrame = self.scrollView.frame;
    newRectFrame.size.height += keyboardSize.height;
    self.scrollView.frame = newRectFrame;
}


#pragma mark =================================================================
#pragma mark : Keyboard handler

CGRect CGRectShrinkHeight(CGRect rect, CGFloat amount)
{
    return CGRectMake(rect.origin.x, rect.origin.y,
                      rect.size.width, rect.size.height - amount);
}

- (UIToolbar *) accessoryView
{
	// 回傳輔助視圖，有著兩個按鈕的工具列：清除與完成
	tb = [[UIToolbar alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.view.frame.size.width, 44.0f)];
	tb.tintColor = [UIColor darkGrayColor];
	
	NSMutableArray *items = [NSMutableArray array];
	[items addObject:BARBUTTON(@"Clear", @selector(clearText))];
	[items addObject:SYSBARBUTTON(UIBarButtonSystemItemFlexibleSpace, nil)];
	[items addObject:BARBUTTON(@"Done", @selector(leaveKeyboardMode))];
	tb.items = items;
	
	return tb;
}

// 以輔助視圖上的按鈕清除輸入文字
- (void) clearText
{
	[introduction setText:@""];
}

// 以輔助視圖上的按鈕解除鍵盤
- (void) leaveKeyboardMode
{
	[introduction resignFirstResponder];
}

- (void) keyboardWillHide: (NSNotification *) notification
{
	// 回到先前大小
	introduction.frame = self.view.bounds;
    NSLog(@"accessoryView size = (%f, %f)", introduction.frame.size.width, introduction.frame.size.height);
    NSLog(@"View size = (%f, %f)", self.view.bounds.size.width, self.view.bounds.size.height);
    
}

- (void) adjustForKeyboard: (NSNotification *) notification
{
    
	// 取得userInfo字典裡的鍵盤bounds
	CGRect kbounds;
	NSDictionary *userInfo = [notification userInfo];
	[(NSValue *)[userInfo objectForKey:@"UIKeyboardBoundsUserInfoKey"] getValue:&kbounds];
    
	// 收縮文字視圖的frame -- 註解底下這行，看看預設的樣子
    CGRect destRect = CGRectShrinkHeight(self.view.bounds, kbounds.size.height);
	introduction.frame = destRect;
}

/**********************
 - (void) keyboardWillHide:(NSNotification *) notification
 {
 // 回復原先的尺寸大小
 _tv.frame = self.view.bounds;
 }
 
 - (void) keyboardDidShow: (NSNotification *) notification
 {
 CGRect kbounds;
 NSDictionary *userInfo = [notification userInfo];
 [(NSValue *) [userInfo objectForKey:@"UIKeyboardBoundsUserInfoKey"] getValue:&kbounds];
 
 // 收縮 TextView 的 Frame
 _tv.frame = CGRectShrinkHeight(self.view.bounds, kbounds.size.height);
 }
 ******/

- (void) initTextFieldKeyPadHandler
{
    for (UIView *view in self.view.subviews) {
        /***************
        if ([view isKindOfClass:[UITextField class]]) {
            UITextField *aTextField = (UITextField *) view;
            aTextField.delegate = (id<UITextFieldDelegate>) self;
            aTextField.returnKeyType = UIReturnKeyDone;
            aTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
            aTextField.borderStyle = UITextBorderStyleRoundedRect;
            aTextField.autocorrectionType = UITextAutocorrectionTypeNo;
        }
         *************/
        
        if ([view isKindOfClass:[UITextView class]]) {
            UITextView *aTextField = (UITextView *) view;
            aTextField.delegate = (id<UITextViewDelegate>) self;
            aTextField.returnKeyType = UIReturnKeyDefault;
            aTextField.autocorrectionType = UITextAutocorrectionTypeNo;
        }
        
    };
}

- (void)viewDidUnload {
    [self setTitle:nil];
    [self setNoteDate:nil];
    [super viewDidUnload];
}
@end
