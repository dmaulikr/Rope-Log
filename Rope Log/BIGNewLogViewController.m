//
//  BIGNewLogViewController.m
//  Rope Log
//
//  Created by Kyle on 6/8/14.
//  Copyright (c) 2014 Big Chicken. All rights reserved.
//

#import "BIGNewLogViewController.h"
#import "BIGCoreDataStack.h"


@interface BIGNewLogViewController ()

@property (strong, nonatomic) IBOutlet UITextField *textField;

@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;
@end

@implementation BIGNewLogViewController

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
    NSLog(@"If this shows up that means we did it! %@", self.theRope);
    // Do any additional setup after loading the view.
    
    [self.datePicker addTarget:self action:@selector(datePickerChanged:) forControlEvents:UIControlEventValueChanged];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dismissSelf {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)insertNewLog {
    BIGCoreDataStack *coreDataStack = [BIGCoreDataStack defaultStack];
    BIGRopeLog *newLog = [NSEntityDescription insertNewObjectForEntityForName:@"BIGRopeLog" inManagedObjectContext:coreDataStack.managedObjectContext];

    newLog.date = [self.datePicker.date timeIntervalSince1970];
    newLog.body = self.textField.text;
    newLog.logForRope = self.theRope;

    NSLog(@"%@", newLog.body);
    [coreDataStack saveContext];
}

- (void)datePickerChanged:(UIDatePicker *)datePicker {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy HH:mm"];
    NSString *strDate = [dateFormatter stringFromDate:datePicker.date];
    NSLog(@"%@", strDate);
}

- (IBAction)cancelWasPressed:(id)sender {
    [self dismissSelf];
}

- (IBAction)doneWasPressed:(id)sender {
    [self insertNewLog];
    [self dismissSelf];
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
