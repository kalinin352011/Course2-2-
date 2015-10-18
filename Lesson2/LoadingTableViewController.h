//
//  LoadingTableViewController.h
//  Lesson2
//
//  Created by Azat Almeev on 26.09.15.
//  Copyright © 2015 Azat Almeev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoadingTableViewController : UITableViewController
- (void)loadDataUsingLastID:(NSNumber *)lastId;
- (void)didLoadNewData:(NSArray *)items;
- (void)didFailToLoadDataWithError:(NSError *)error;
@end
