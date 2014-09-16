//
//  BIGRopeCell.m
//  Rope Log
//
//  Created by Kyle on 6/30/14.
//  Copyright (c) 2014 Big Chicken. All rights reserved.
//

#import "BIGRopeCell.h"
#import "BIGRopeList.h"

@implementation BIGRopeCell

+ (CGFloat)heightForEntry:(BIGRopeList *)rope {
    const CGFloat topMargin = 35.0f;
    const CGFloat bottomMargin = 35.0f;
    const CGFloat minHeight = 85.0f;
    
    UIFont *font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
    
    CGRect boundingBox = [rope.name boundingRectWithSize:CGSizeMake(202, CGFLOAT_MAX) options:(NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName: font} context:nil];
    
    return MAX(minHeight, CGRectGetHeight(boundingBox) + topMargin + bottomMargin);
    
}

@end
