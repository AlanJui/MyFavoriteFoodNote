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
