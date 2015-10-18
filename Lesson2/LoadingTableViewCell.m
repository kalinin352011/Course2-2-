//
//  LoadingTableViewCell.m
//  Lesson2
//
//  Created by Azat Almeev on 06.10.15.
//  Copyright © 2015 Azat Almeev. All rights reserved.
//

#import "LoadingTableViewCell.h"

@implementation LoadingTableViewCell

- (void)prepareForReuse {
    [super prepareForReuse];
    UIActivityIndicatorView *indicator = (UIActivityIndicatorView *)[self viewWithTag:1];
    [indicator startAnimating];
}
@end
