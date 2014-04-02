//
//  BookTableViewController.h
//  Library
//
//  Created by Daniel Fairbanks on 3/29/14.
//  Copyright (c) 2014 Fairbanksdan. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Shelf.h"

@interface BookTableViewController : UITableViewController<UIAlertViewDelegate>

@property (strong, nonatomic) NSString *bookName;
@property (strong, nonatomic) Shelf *shelf;

@end
