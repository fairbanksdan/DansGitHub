//
//  Book.m
//  Library
//
//  Created by Daniel Fairbanks on 3/31/14.
//  Copyright (c) 2014 Fairbanksdan. All rights reserved.
//

#import "Book.h"

@implementation Book

- (instancetype) initWithTitle:(NSString *)title {
    if (self = [super init])
    {
        self.title = title;
        self.shelf = nil;
    }
    
    return self;
    
}
- (void) enshelf:(Shelf *)shelf {
    [shelf.books addObject:self];
    self.shelf = shelf;
}

- (void) unshelf {
    [self.shelf.books removeObject:self];
    self.shelf = nil;
}

@end
