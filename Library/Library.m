//
//  Library.m
//  Library
//
//  Created by Daniel Fairbanks on 3/30/14.
//  Copyright (c) 2014 Fairbanksdan. All rights reserved.
//

#import "Library.h"
#import "Shelf.h"

@implementation Library

- (instancetype) initWithName:(NSString *)library{
    if (self = [super init])
    {
        self.libraryName = library;
        self.shelves = [[NSMutableArray alloc] init];
    }
    
    return self;
}
- (NSArray *)allBooks {
    NSMutableArray *collectedBooks;
    for (Shelf *shelf in self.shelves) {
        [collectedBooks addObjectsFromArray:shelf.books];
    }
    return collectedBooks;
}

@end
