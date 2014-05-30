//
//  BIGAppDelegate.h
//  Rope Log
//
//  Created by Kyle on 5/29/14.
//  Copyright (c) 2014 Big Chicken. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BIGAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
