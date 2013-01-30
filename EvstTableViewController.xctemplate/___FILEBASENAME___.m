//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
#import "___FILEBASENAME___.h"

@interface ___FILEBASENAMEASIDENTIFIER___ ()
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@end

@implementation ___FILEBASENAMEASIDENTIFIER___

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
    <#Code when row is selected#>
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    return <#heightForRowAtIndexPath#>;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[[self fetchedResultsController] sections] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[[self fetchedResultsController] sections] objectAtIndex:section] numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    <#return [[UITableViewCell alloc] init];#>
}

#pragma mark - NSFetchedResultsController Setup
- (NSFetchedResultsController *)fetchedResultsController 
{

    if (_fetchedResultsController) 
    {
        return _fetchedResultsController;
    }
    
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:<#Entity Name#>];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"<#Predicate#>"];
    [request setPredicate:predicate];

    NSSortDescriptor *sort = [[NSSortDescriptor alloc] initWithKey:@"<#Sort#>" ascending:NO];
    [request setSortDescriptors:@[sort]];
    
    NSFetchedResultsController *fetchedResultsController;
    NSManagedObjectContext *context = <#Main Context#>;
    fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                                                   managedObjectContext:context
                                                                     sectionNameKeyPath:nil
                                                                              cacheName:nil];
    [fetchedResultsController setDelegate:self];
    [self setFetchedResultsController:fetchedResultsController];
    
    NSError *error = nil;
    if (![fetchedResultsController performFetch:&error])	
    {
        <#NSLog#>(@"Error: %@", [error localizedFailureReason]);
    }
    
    return _fetchedResultsController;
}

#pragma mark - NSFetchedResultsControllerDelegate (Apple docs copy/paste)

/*
 Assume self has a property 'tableView' -- as is the case for an instance of a UITableViewController
 subclass -- and a method configureCell:atIndexPath: which updates the contents of a given cell
 with information from a managed object at the given index path in the fetched results controller.
 */

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView beginUpdates];
}


- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo
           atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type
{
    
    switch(type) 
    {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex]
                          withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex]
                          withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}


- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath
{
    
    switch(type) 
        {
            
        case NSFetchedResultsChangeInsert:
            [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath]
                             withRowAnimation:UITableViewRowAnimationNone];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                             withRowAnimation:UITableViewRowAnimationNone];
            break;
            
        case NSFetchedResultsChangeUpdate:
            //      [self configureCell:[tableView cellForRowAtIndexPath:indexPath]
            //              atIndexPath:indexPath];
            break;
            
        case NSFetchedResultsChangeMove:
            [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
            [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView endUpdates];
}


@end
