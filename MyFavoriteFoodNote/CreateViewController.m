//
//  CreateViewController.m
//  MyFavoriteFoodNote
//
//  Created by 居正中 on 12/10/8.
//  Copyright (c) 2012年 CCC Studio. All rights reserved.
//

#import "CreateViewController.h"

@interface CreateViewController ()


@end

@implementation CreateViewController
@synthesize scrollView;
@synthesize noteDate;
@synthesize restName;
@synthesize introduction;
@synthesize address;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    NSDate *now = [NSDate date];
    NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
    [dateFormater setDateFormat:@"YYYY/MM/dd"];
    NSString *today = [dateFormater stringFromDate:now];  //date data
    
    self.noteDate.text = today;
    if (self.photoImage != nil) {
        self.photoImageView.image = self.photoImage;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardIsShown:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardIsHidden:)
                                                 name:UIKeyboardDidHideNotification
                                               object:nil];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"Unregistering for keyboard events");
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveButtonPressed:(id)sender {

    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = appDelegate.managedObjectContext;
    NSManagedObject *newManagedObject = [NSEntityDescription insertNewObjectForEntityForName:@"Food" inManagedObjectContext:context];
/***********
    [newManagedObject setValue:[NSDate date] forKey:@"noteDate"];
    [newManagedObject setValue:@"愛家連鎖餐廳" forKey:@"restName"];
    [newManagedObject setValue:@"愛家為全球世界級的蔬食連鎖餐廳，提供美味好吃的餐飲，為環保救地球，盡一份力量。" forKey:@"introduction"];
    [newManagedObject setValue:@"新北市汐止區新台五路" forKey:@"address"];
 **********/
    
    //[newManagedObject setValue:noteDate.text forKey:@"noteDate"];
    [newManagedObject setValue:[NSDate date] forKey:@"noteDate"];
    [newManagedObject setValue:restName.text forKey:@"restName"];
    [newManagedObject setValue:introduction.text forKey:@"introduction"];
    [newManagedObject setValue:address.text forKey:@"address"];
    
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
    
    TakePhotoViewController *takePhotoViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"takePhoto"];
    [self presentViewController:takePhotoViewController animated:YES completion:nil];
}

#pragma mark - Keyboard Handdling

- (IBAction)doneButtonTapped:(id)sender
{
    [sender resignFirstResponder];
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

@end
