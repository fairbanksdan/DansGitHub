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
    /*books1 = [NSArray arrayWithObjects:[[Book alloc] initWithTitle:@"Harry Potter"], [[Book alloc] initWithTitle:@"The Once and Future King"], [[Book alloc] initWithTitle:@"Les Miserables"], nil];
    books2 = [NSArray arrayWithObjects:[[Book alloc] initWithTitle:@"Gone with the Wind"], [[Book alloc] initWithTitle:@"To Kill a Mocking Bird"], [[Book alloc] initWithTitle:@"Jurassic Park"], nil];
    books3 = [NSArray arrayWithObjects:[[Book alloc] initWithTitle:@"The Hobbit"], [[Book alloc] initWithTitle:@"Jane Eyre"], [[Book alloc] initWithTitle:@"War and Peace"], [[Book alloc] initWithTitle:@"Uncle Tom's Cabin"], nil];
    books4 = [NSArray arrayWithObjects:[[Book alloc] initWithTitle:@"A Tale of Two Cities"], [[Book alloc] initWithTitle:@"Pride and Prejudice"], [[Book alloc] initWithTitle:@"Ivanhoe"], nil];
    */
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.shelf = [[Shelf alloc] initWithName:@"Shelf 1"];
    
    NSArray *books = [NSArray arrayWithObjects:[[Book alloc] initWithTitle:@"Harry Potter"], [[Book alloc] initWithTitle:@"The Once and Future King"], [[Book alloc] initWithTitle:@"Les Miserables"], nil];
    
    for (Book *book in books) {
        [book enshelf:self.shelf];
    }
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
    /*if ([_bookName isEqualToString:@"Shelf 1"]) {
        return [books1 count];
    }
    else if([_bookName isEqualToString:@"Shelf 2"]) {
        return [books2 count];
    }
    else if([_bookName isEqualToString:@"Shelf 3"]) {
        return [books3 count];
    }
    else if([_bookName isEqualToString:@"Shelf 4"]) {
        return [books4 count];
    }*/

    return self.shelf.books.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *SimpleTableIdentifier = @"BookCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SimpleTableIdentifier];
    }
    
    Book *book = [self.shelf.books objectAtIndex:indexPath.row];
    cell.textLabel.text = book.title;
    /*
    if ([_bookName isEqualToString:@"Shelf 1"]) {
        Book *book = [books1 objectAtIndex:indexPath.row];
        cell.textLabel.text = book.title;
    }
    else if ([_bookName isEqualToString:@"Shelf 2"]) {
        cell.textLabel.text = [books2 objectAtIndex:indexPath.row];
    }
    else if ([_bookName isEqualToString:@"Shelf 3"]) {
        cell.textLabel.text = [books3 objectAtIndex:indexPath.row];
    }
    else if ([_bookName isEqualToString:@"Shelf 4"]) {
        cell.textLabel.text = [books4 objectAtIndex:indexPath.row];
    }*/
    
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
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
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
