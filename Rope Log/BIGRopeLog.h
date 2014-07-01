//
//  BIGRopeLog.h
//  Rope Log
//
//  Created by Kyle on 5/29/14.
//  Copyright (c) 2014 Big Chicken. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class BIGRopeList;

@interface BIGRopeLog : NSManagedObject

@property (nonatomic) NSTimeInterval date;
@property (nonatomic, retain) NSString * body;
@property (nonatomic, retain) BIGRopeList *logForRope;

@property (nonatomic, readonly) NSString *sectionName;

@end
