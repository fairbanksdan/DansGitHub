//
//  ShelfTableViewController.h
//  Library
//
//  Created by Daniel Fairbanks on 3/29/14.
//  Copyright (c) 2014 Fairbanksdan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Library.h"
#import "Shelf.h"

@interface ShelfTableViewController : UITableViewController

@property (strong, nonatomic) NSString *shelves;
@property (strong, nonatomic) Library *library;
@property (readwrite) Shelf *shelf;

@end
