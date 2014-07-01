//
//  BIGCoreDataStack.h
//  Rope Log
//
//  Created by Kyle on 5/29/14.
//  Copyright (c) 2014 Big Chicken. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BIGCoreDataStack : NSObject

+ (instancetype)defaultStack;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
