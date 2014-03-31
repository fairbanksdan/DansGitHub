//
//  Book.h
//  Library
//
//  Created by Daniel Fairbanks on 3/31/14.
//  Copyright (c) 2014 Fairbanksdan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "shelf.h"

@interface Book : NSObject

@property (readwrite) Shelf *shelf;

@property (readwrite) NSString *title;

- (instancetype) initWithTitle:(NSString *)title;

- (void) enshelf:(Shelf *)shelf;

- (void) unshelf;

@end
