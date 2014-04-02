//
//  Shelf.m
//  Library
//
//  Created by Daniel Fairbanks on 3/31/14.
//  Copyright (c) 2014 Fairbanksdan. All rights reserved.
//

#import "Shelf.h"
#import "Book.h"

@implementation Shelf

- (instancetype) initWithName:(NSString *)shelfName{
    if (self = [super init])
    {
        self.shelfName = shelfName;
        self.books = [[NSMutableArray alloc] init];
    }
    
    return self;
}
- (void) addNewBookWithTitle: (NSString *)title {
    
    Book *book  = [[Book alloc] initWithTitle: title];
    
    [book enshelf: self];
    
}


@end
