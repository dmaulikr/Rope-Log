//
//  BIGRopeLogTableViewController.m
//  Rope Log
//
//  Created by Kyle on 6/4/14.
//  Copyright (c) 2014 Big Chicken. All rights reserved.
//

#import "BIGRopeLogTableViewController.h"
#import "BIGCoreDataStack.h"
#import "BIGLogDetailViewController.h"
#import "BIGLogCell.h"


@interface BIGRopeLogTableViewController () <NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@end

@implementation BIGRopeLogTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization 
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = self.thisRope.name;
    NSLog(@"%@", self.thisRope);
   
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self.fetchedResultsController performFetch:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return self.fetchedResultsController.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    id <NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController sections][section];
    return [sectionInfo numberOfObjects];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BIGLogCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    BIGRopeLog *log = [self.fetchedResultsController objectAtIndexPath:indexPath];
    [cell configureCellForLog:log];
    
    return cell;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    BIGRopeLog *log = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    BIGCoreDataStack *coreDataStack = [BIGCoreDataStack defaultStack];
    [[coreDataStack managedObjectContext] deleteObject:log];
    [coreDataStack saveContext];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    id <NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController sections][section];
    return [sectionInfo name];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    BIGRopeLog *log = [self.fetchedResultsController objectAtIndexPath:indexPath];
    return [BIGLogCell heightForEntry:log];

}

#pragma mark - Fetch Request

- (NSFetchedResultsController *)fetchedResultsController {
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    BIGCoreDataStack *coreDataStack = [BIGCoreDataStack defaultStack];
    NSFetchRequest *fetchRequest = [self ropeLogFetchRequest];
    
    _fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:coreDataStack.managedObjectContext sectionNameKeyPath:@"sectionName" cacheName:nil];
    _fetchedResultsController.delegate = self;
    
    return _fetchedResultsController;
}

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
    switch (type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        case NSFetchedResultsChangeUpdate:
            [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
    }
}

- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id<NSFetchedResultsSectionInfo>)sectionInfo atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type {
    switch (type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
    }
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView endUpdates];
}

- (NSFetchRequest *)ropeLogFetchRequest {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"BIGRopeLog"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"logForRope = %@", self.thisRope];
    
    fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"date" ascending:NO]];
    fetchRequest.predicate = predicate;
    
    return fetchRequest;
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    BIGRopeList *selectedRope = self.thisRope;
    NSString *passThis = @"Passed Item";
    NSLog(@"%@", passThis);
    
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    BIGRopeLog *selectedLog = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    if ([segue.identifier isEqualToString:@"pushToNewLog"]) {
        BIGNewLogViewController *logVC = [segue destinationViewController];
        logVC.theRope = selectedRope;
        logVC.secondPass = passThis;
    }
    
    if ([segue.identifier isEqualToString:@"pushToLogDetail"]) {
        BIGLogDetailViewController *logDetailVC = [segue destinationViewController];
        logDetailVC.thisLog = selectedLog;
    }
}

- (void)dismissSelf {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)backWasPressed:(id)sender {
    [self dismissSelf];
}
//- (IBAction)unwindCancel:(UIStoryboardSegue *)segue
//{}
//
//- (IBAction)unwindDone:(UIStoryboardSegue *)segue
//{}


@end
