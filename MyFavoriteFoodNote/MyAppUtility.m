//
//  MyAppUtility.m
//  MyFavoriteFoodNote
//
//  Created by 居正中 on 12/10/14.
//  Copyright (c) 2012年 CCC Studio. All rights reserved.
//

#import "MyAppUtility.h"

@implementation MyAppUtility

/*
 * 將 NSDate 型態資料，轉換成 NSString 型態資料
 */
+ (NSString *) convertDateToString:(NSDate *) date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY/MM/dd"];
    return [dateFormatter stringFromDate:date];
}

+ (NSDate *) convertStringToDate:(NSString *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY/MM/dd"];
    return [dateFormatter dateFromString:date];
}

@end
