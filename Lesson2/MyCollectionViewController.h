//
//  MyCollectionViewController.h
//  Lesson2
//
//  Created by Эдуард Рязапов on 07.10.15.
//  Copyright © 2015 Azat Almeev. All rights reserved.
//

#import "LoadingCollectionViewController.h"

@interface MyCollectionViewController : LoadingCollectionViewController
@property (nonatomic) NSMutableArray *items;
@property BOOL isLoading;
@property BOOL didFail;
@end
