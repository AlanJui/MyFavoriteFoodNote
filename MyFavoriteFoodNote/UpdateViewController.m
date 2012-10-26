//
//  UpdateViewController.m
//  MyFavoriteFoodNote
//
//  Created by 居正中 on 12/10/8.
//  Copyright (c) 2012年 CCC Studio. All rights reserved.
//

#import "UpdateViewController.h"
#import "AppDelegate.h"
#import "GoodNews.h"

@interface UpdateViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation UpdateViewController

- (void) setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
//        [self configureView];
    }
    
    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    
    if (_detailItem) {
        NSManagedObject *item = (NSManagedObject *) _detailItem;
        NSLog(@"item = %@", [item description]);
        
        _noteDate.text = [MyAppUtility convertDateToString:[item valueForKey:@"noteDate"]];
        _titleName.text = [item valueForKey:@"title"];
        _introduction.text = [item valueForKey:@"introduction"];
        _storeName.text = [item valueForKey:@"storeName"];
        _address.text = [item valueForKey:@"address"];
        
        NSLog(@"_noteDate.text = %@", [MyAppUtility convertDateToString:[item valueForKey:@"noteDate"]]);
        NSLog(@"_titleName.text = %@", [item valueForKey:@"title"]);
        NSLog(@"_introduction.text = %@", [item valueForKey:@"introduction"]);
        NSLog(@"_storeName.text = %@", [item valueForKey:@"storeName"]);
        NSLog(@"_address.text = %@", [item valueForKey:@"address"]);
        
        NSLog(@"_noteDate.text = %@", _noteDate.text);
        NSLog(@"_titleName.text = %@", _titleName.text);
        NSLog(@"_introduction.text = %@", _introduction.text);
        NSLog(@"_storeName.text = %@", _storeName.text);
        NSLog(@"_address.text = %@", _address.text);    
    }
}

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
}

- (void) viewWillAppear:(BOOL)animated
{
    [self configureView];
    /*****
    Food *foodNote = self.detailItem;
    self.title.text = foodNote.title;
    self.noteDate.text = [MyAppUtility convertDateToString:foodNote.noteDate];
    self.restName.text = foodNote.restName;
    self.introduction.text = foodNote.introduction;
    self.address.text = foodNote.address;
     *****/
}

- (void) viewWillDisappear:(BOOL)animated
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

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)saveButtonPressed:(id)sender
{
    NSLog(@"_noteDate.text = %@", _noteDate.text);
    NSLog(@"_titleName.text = %@", _titleName.text);
    NSLog(@"_introduction.text = %@", _introduction.text);
    NSLog(@"_storeName.text = %@", _storeName.text);
    NSLog(@"_address.text = %@", _address.text);

    NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
    NSManagedObject *object = [self.fetchedResultsController objectAtIndexPath:self.indexPath];
    //    NSLog(@"object before = %@", [object description]);
    
    [object setValue:[MyAppUtility convertStringToDate:_noteDate.text] forKey:@"noteDate"];
    [object setValue:_titleName.text forKey:@"title"];
    [object setValue:_introduction.text forKey:@"introduction"];
    [object setValue:_storeName.text forKey:@"storeName"];
    [object setValue:_address.text forKey:@"address"];
    //    NSLog(@"object after = %@", [object description]);
    
    // Save the context.
    NSError *error = nil;
    if (![context save:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
  
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Keyboard Handdling

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)doneButtonTapped:(id)sender
{
    [sender resignFirstResponder];
}

/*****
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
*****/

- (void)viewDidUnload {
    [self setNoteDate:nil];
    [super viewDidUnload];
}

@end
