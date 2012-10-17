//
//  UpdateViewController.m
//  MyFavoriteFoodNote
//
//  Created by 居正中 on 12/10/8.
//  Copyright (c) 2012年 CCC Studio. All rights reserved.
//

#import "UpdateViewController.h"
#import "AppDelegate.h"
#import "Food.h"

@interface UpdateViewController ()
{
    BOOL keyboardIsShown;
}
@end

@implementation UpdateViewController
//@synthesize detailItem;
//@synthesize noteDate, restName, introduction, address;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    Food *foodNote = self.detailItem;
    //self.noteDate.text = [foodNote.noteDate description];
    self.noteDate.text = [MyAppUtility convertDateToString:foodNote.noteDate];
    self.restName.text = foodNote.restName;
    self.introduction.text = foodNote.introduction;
    self.address.text = foodNote.address;
    
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

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)saveButtonPressed:(id)sender
{
    /****
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = appDelegate.managedObjectContext;
    NSManagedObject *newManagedObject = [NSEntityDescription insertNewObjectForEntityForName:@"Food" inManagedObjectContext:context];
 
    //[newManagedObject setValue:noteDate.text forKey:@"noteDate"];
    [newManagedObject setValue:[NSDate date] forKey:@"noteDate"];
    [newManagedObject setValue:self.restName.text forKey:@"restName"];
    [newManagedObject setValue:self.introduction.text forKey:@"introduction"];
    [newManagedObject setValue:self.address.text forKey:@"address"];
    
    // Save the context.
    NSError *error = nil;
    if (![context save:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    ***/
    NSDate *date = [[NSDate alloc] init];
    date = [MyAppUtility convertStringToDate:self.noteDate.text];
    [self.navigationController popViewControllerAnimated:YES];
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
