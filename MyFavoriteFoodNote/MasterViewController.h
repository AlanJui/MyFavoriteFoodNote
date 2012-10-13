//
//  MasterViewController.h
//  MyFavoriteFoodNote
//
//  Created by 居正中 on 12/10/7.
//  Copyright (c) 2012年 CCC Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;
@class UpdateViewController;

#import <CoreData/CoreData.h>

@interface MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) DetailViewController *detailViewController;
@property (strong, nonatomic) UpdateViewController *updateViewController;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
