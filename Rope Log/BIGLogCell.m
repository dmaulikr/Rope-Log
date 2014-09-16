//
//  BIGLogCell.m
//  Rope Log
//
//  Created by Kyle on 7/1/14.
//  Copyright (c) 2014 Big Chicken. All rights reserved.
//

#import "BIGLogCell.h"
#import "BIGRopeLog.h"

@interface BIGLogCell ()
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *bodyLabel;
@property (weak, nonatomic) IBOutlet UILabel *thirdLabel;

@end


@implementation BIGLogCell

+ (CGFloat)heightForEntry:(BIGRopeLog *)log {
    const CGFloat topMargin = 35.0f;
    const CGFloat bottomMargin = 80.0f;
    const CGFloat minHeight = 106.0f;
    
    UIFont *font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
    
    CGRect boundingBox = [log.body boundingRectWithSize:CGSizeMake(202, CGFLOAT_MAX) options:(NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName: font} context:nil];
    
    return MAX(minHeight, CGRectGetHeight(boundingBox) + topMargin + bottomMargin);
}

- (void)configureCellForLog:(BIGRopeLog *)log {
    self.bodyLabel.text = log.body;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEE, MMMM d yyyy"];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:log.date];
    
    self.dateLabel.text = [dateFormatter stringFromDate:date];
}

@end
