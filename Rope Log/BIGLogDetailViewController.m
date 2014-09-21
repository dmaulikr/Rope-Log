//
//  BIGLogDetailViewController.m
//  Rope Log
//
//  Created by Kyle on 6/29/14.
//  Copyright (c) 2014 Big Chicken. All rights reserved.
//

#import "BIGLogDetailViewController.h"

@interface BIGLogDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *bodyLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end

@implementation BIGLogDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"The long thing I wrote is: %@", self.thisLog.body);
    
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MMMM d, yyyy"];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:self.thisLog.date];
    
    
    
    self.bodyLabel.text = self.thisLog.body;
    self.dateLabel.text = [dateFormatter stringFromDate:date];
    
}

/*-------Sets the text to the top of the label by "shrink wrapping" the frame around the text (sizeToFit) then rebuilding the original frame with CGRect-------*/
- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    [self.bodyLabel sizeToFit];
    
    CGRect myFrame = self.bodyLabel.frame;
    // Resize the frame's width to 280 (320 - margins)
    // width could also be myOriginalLabelFrame.size.width
    myFrame = CGRectMake(myFrame.origin.x, myFrame.origin.y, 280, myFrame.size.height);
    self.bodyLabel.frame = myFrame;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
