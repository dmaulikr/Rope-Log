//
//  BIGRopeList.h
//  Rope Log
//
//  Created by Kyle on 5/29/14.
//  Copyright (c) 2014 Big Chicken. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface BIGRopeList : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *ropeForEntry;
@end

@interface BIGRopeList (CoreDataGeneratedAccessors)

- (void)addRopeForEntryObject:(NSManagedObject *)value;
- (void)removeRopeForEntryObject:(NSManagedObject *)value;
- (void)addRopeForEntry:(NSSet *)values;
- (void)removeRopeForEntry:(NSSet *)values;

@end
