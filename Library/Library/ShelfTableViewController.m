//
//  ShelfTableViewController.m
//  Library
//
//  Created by Daniel Fairbanks on 3/29/14.
//  Copyright (c) 2014 Fairbanksdan. All rights reserved.
//

#import "ShelfTableViewController.h"
#import "BookTableViewController.h"
#import "Shelf.h"
#import "Library.h"

@interface ShelfTableViewController ()

@end

@implementation ShelfTableViewController {
    NSArray *shelf;
}

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
    
    
    self.library = [[Library alloc] initWithName:@"Library"];
    
    
    // Add all the shelves to the library object
    [self.library.shelves addObject: [[Shelf alloc] initWithName:@"Shelf 1"]];
    
    [self.library.shelves addObject: [[Shelf alloc] initWithName:@"Shelf 2"]];
    
    [self.library.shelves addObject: [[Shelf alloc] initWithName:@"Shelf 3"]];
    
    [self.library.shelves addObject: [[Shelf alloc] initWithName:@"Shelf 4"]];
    
    
    // to facilitate the full flow from the ShelfTableViewController to the BookTableViewController,
    
    // you will need to then create books, and then enshelf them in the right shelf.  You will probably need to create a temporary shelf variable before adding the shelf itself into self.library.shelves.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [shelf count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *SimpleTableIdentifier = @"ShelfCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SimpleTableIdentifier];
    }
    
    Shelf *shelf1 = [self.library.shelves objectAtIndex:indexPath.row];
    cell.textLabel.text = shelf1.shelfName;
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([segue.identifier isEqualToString:@"showArrayDetail2"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        BookTableViewController *destViewController = segue.destinationViewController;
        //#warning this is where changes need to be made alfred.gopez@gmail.com
        // destViewController.bookName = [shelf objectAtIndex:indexPath.row]; // with the line below, you can delete the bookName property on the bookTableViewController.
        destViewController.shelf = [self.library.shelves objectAtIndex:indexPath.row];
        destViewController.title = destViewController.bookName;
    }
}

@end
