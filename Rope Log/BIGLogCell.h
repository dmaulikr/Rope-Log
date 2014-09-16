//
//  BIGLogCell.h
//  Rope Log
//
//  Created by Kyle on 7/1/14.
//  Copyright (c) 2014 Big Chicken. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BIGRopeLog;

@interface BIGLogCell : UITableViewCell

+ (CGFloat)heightForEntry:(BIGRopeLog *)log;

- (void)configureCellForLog:(BIGRopeLog *)log;

@end
