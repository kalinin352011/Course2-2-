//
//  LoadingCollectionViewController.m
//  Lesson2
//
//  Created by Эдуард Рязапов on 07.10.15.
//  Copyright © 2015 Azat Almeev. All rights reserved.
//

#import "LoadingCollectionViewController.h"

@implementation LoadingCollectionViewController

- (NSArray *)arrayFromStart:(NSNumber *)start {
    NSMutableArray *res = [NSMutableArray new];
    NSInteger offset = [start integerValue];
    if (offset > 0)
        offset++;
    for (NSInteger i = 0; i < 20; i++)
        [res addObject:@(i + offset)];
    return res.copy;
}

- (void)loadDataUsingLastID:(NSNumber *)lastId {
    double delay = .5 + arc4random_uniform(100) / 100.;
//    if (arc4random_uniform(100) > 10)
        [self performSelector:@selector(didLoadNewData:) withObject:[self arrayFromStart:lastId] afterDelay:delay];
//    else
//        [self performSelector:@selector(didFailToLoadDataWithError:) withObject:[NSError errorWithDomain:@"Lesson2" code:500 userInfo:@{ NSLocalizedDescriptionKey : @"Internal error during loading data" }] afterDelay:delay];
}

- (void)didLoadNewData:(NSArray *)items {
    @throw [NSException exceptionWithName:@"Missing implementation" reason:@"You should override that method in subclass" userInfo:nil];
}

- (void)didFailToLoadDataWithError:(NSError *)error {
    @throw [NSException exceptionWithName:@"Missing implementation" reason:@"You should override that method in subclass" userInfo:nil];
}

@end
