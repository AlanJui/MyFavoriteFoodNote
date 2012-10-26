//
//  GoodNews.h
//  MyFavoriteFoodNote
//
//  Created by 居正中 on 12/10/25.
//  Copyright (c) 2012年 CCC Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface GoodNews : NSManagedObject

@property (nonatomic, retain) NSString * address;
@property (nonatomic, retain) NSString * introduction;
@property (nonatomic, retain) NSString * mapLocation;
@property (nonatomic, retain) NSDate * noteDate;
@property (nonatomic, retain) NSString * photo;
@property (nonatomic, retain) NSString * storeName;
@property (nonatomic, retain) NSString * title;

@end
