//
//  BIGRopeLog.m
//  Rope Log
//
//  Created by Kyle on 5/29/14.
//  Copyright (c) 2014 Big Chicken. All rights reserved.
//

#import "BIGRopeLog.h"
#import "BIGRopeList.h"


@implementation BIGRopeLog

@dynamic date;
@dynamic body;
@dynamic logForRope;
-(NSString *)sectionName {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:self.date];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //[dateFormatter setDateFormat:@"dd MMM yyyy"];
    [dateFormatter setDateFormat:@"yyyy"];
    
    return [dateFormatter stringFromDate:date];
}

@end
