//
//  Library.h
//  Library
//
//  Created by Daniel Fairbanks on 3/30/14.
//  Copyright (c) 2014 Fairbanksdan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Library : NSObject

@property (strong, nonatomic) NSString *libraryName;

@property (readwrite) NSMutableArray *shelves;

- (instancetype) initWithName:(NSString *)library;

- (NSArray *)allBooks;

@end
