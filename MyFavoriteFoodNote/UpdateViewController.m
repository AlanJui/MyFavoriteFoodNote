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
    self.noteDate.text = [foodNote.noteDate description];
    self.restName.text = foodNote.restName;
    self.introduction.text = foodNote.introduction;
    self.address.text = foodNote.address;
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
    [self.navigationController popViewControllerAnimated:YES];
}

/*
-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
*/

@end
