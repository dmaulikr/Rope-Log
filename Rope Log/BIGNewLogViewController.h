//
//  BIGNewLogViewController.h
//  Rope Log
//
//  Created by Kyle on 6/8/14.
//  Copyright (c) 2014 Big Chicken. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BIGRopeList.h"
#import "BIGRopeLog.h"
#import "BIGRopeListTableViewController.h"
#import "BIGRopeLogTableViewController.h"

@interface BIGNewLogViewController : UIViewController

@property (nonatomic, strong) BIGRopeList *theRope;
@property (nonatomic) NSString *secondPass;

@end
