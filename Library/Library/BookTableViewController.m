//
//  BookTableViewController.m
//  Library
//
//  Created by Daniel Fairbanks on 3/29/14.
//  Copyright (c) 2014 Fairbanksdan. All rights reserved.
//

#import "BookTableViewController.h"
#import "Book.h"

@interface BookTableViewController ()

@property (readwrite) NSIndexPath *path;

@end

@implementation BookTableViewController {
    NSArray *books1;
    NSArray *books2;
    NSArray *books3;
    NSArray *books4;
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

    return self.shelf.books.count +1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *SimpleTableIdentifier = @"BookCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SimpleTableIdentifier];
    }
    if (indexPath.row < self.shelf.books.count) {
        Book *book = [self.shelf.books objectAtIndex:indexPath.row];
        cell.textLabel.text = book.title;
    } else {
        cell.textLabel.text = @"Add New Book";
    }
    

    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        Book *book = [self.shelf.books objectAtIndex:indexPath.row];
        [book unshelf];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        
    }   
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger selectedRow = indexPath.row;
    if (selectedRow == self.shelf.books.count) {
        self.path = indexPath;
        UIAlertView * bookTitlePrompt = [[UIAlertView alloc] initWithTitle:@"Add New Book" message:@"Please enter the book title." delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"Ok", nil];
        bookTitlePrompt.alertViewStyle = UIAlertViewStylePlainTextInput;
        [bookTitlePrompt show];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        [self.shelf addNewBookWithTitle:[[alertView textFieldAtIndex:0] text]];
        
        NSArray *paths = [NSArray arrayWithObject:self.path];
        [self.tableView insertRowsAtIndexPaths:paths withRowAnimation:UITableViewRowAnimationTop];
    }
    
}

// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
