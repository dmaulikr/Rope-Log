//
//  BIGRopeList.h
//  Rope Log
//
//  Created by Kyle Johnson on 8/3/14.
//  Copyright (c) 2014 Big Chicken. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class BIGRopeLog;

@interface BIGRopeList : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic) NSTimeInterval date;
@property (nonatomic, retain) NSSet *ropeForEntry;
@end

@interface BIGRopeList (CoreDataGeneratedAccessors)

- (void)addRopeForEntryObject:(BIGRopeLog *)value;
- (void)removeRopeForEntryObject:(BIGRopeLog *)value;
- (void)addRopeForEntry:(NSSet *)values;
- (void)removeRopeForEntry:(NSSet *)values;

@end
