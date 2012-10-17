//
//  MyAppUtility.h
//  MyFavoriteFoodNote
//
//  Created by 居正中 on 12/10/14.
//  Copyright (c) 2012年 CCC Studio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyAppUtility : NSObject

+ (NSString *) convertDateToString:(NSDate *)date;
+ (NSDate *) convertStringToDate:(NSString *)date;

@end
