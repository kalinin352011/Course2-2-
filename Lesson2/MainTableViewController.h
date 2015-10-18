//
//  ViewController.h
//  Lesson2
//
//  Created by Azat Almeev on 26.09.15.
//  Copyright © 2015 Azat Almeev. All rights reserved.
//

#import "LoadingTableViewController.h"

@interface MainTableViewController : LoadingTableViewController
@property (nonatomic) NSMutableArray *items;
@property BOOL isLoading;
@property BOOL didFail;
@end

