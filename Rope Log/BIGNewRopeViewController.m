//
//  BIGNewRopeViewController.m
//  Rope Log
//
//  Created by Kyle on 5/29/14.
//  Copyright (c) 2014 Big Chicken. All rights reserved.
//

#import "BIGNewRopeViewController.h"
#import "BIGRopeList.h"
#import "BIGRopeLog.h"
#import "BIGCoreDataStack.h"

@interface BIGNewRopeViewController ()

@property (strong, nonatomic) IBOutlet UITextField *textField;


@end

@implementation BIGNewRopeViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dismissSelf {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)insertNewRope {
    BIGCoreDataStack *coreDataStack = [BIGCoreDataStack defaultStack];
    BIGRopeList *newRope = [NSEntityDescription insertNewObjectForEntityForName:@"BIGRopeList" inManagedObjectContext:coreDataStack.managedObjectContext];
    newRope.name = self.textField.text;
    [coreDataStack saveContext];
}

- (IBAction)doneWasPressed:(id)sender {
    [self insertNewRope];
    [self dismissSelf];
}

- (IBAction)cancelWasPressed:(id)sender {
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
