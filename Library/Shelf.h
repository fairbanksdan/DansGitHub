//
//  Shelf.h
//  Library
//
//  Created by Daniel Fairbanks on 3/31/14.
//  Copyright (c) 2014 Fairbanksdan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Shelf : NSObject

@property (readwrite) NSString *shelfName;

@property (readwrite) NSMutableArray *books;

- (instancetype) initWithName:(NSString *)shelfName;

- (void) addNewBookWithTitle: (NSString *)title;

@end
