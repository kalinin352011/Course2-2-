//
//  MyCollectionViewController.m
//  Lesson2
//
//  Created by Эдуард Рязапов on 07.10.15.
//  Copyright © 2015 Azat Almeev. All rights reserved.
//

#import "MyCollectionViewController.h"

@implementation MyCollectionViewController

static NSString *loadingCellIdentifier = @"LoadingCollectionViewCell";


- (NSMutableArray *)items {
    if (!_items)
        _items = [NSMutableArray new];
    return _items;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView registerNib:[UINib nibWithNibName:@"LoadingCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:loadingCellIdentifier];
}

- (void)didLoadNewData:(NSArray *)items {
    self.isLoading = NO;
    NSInteger offset = self.items.count;
    [self.items addObjectsFromArray:items];
    NSMutableArray *indexPaths = [NSMutableArray new];
    for (NSInteger i = 0; i < items.count; i++) {
        NSIndexPath *ip = [NSIndexPath indexPathForRow:i + offset inSection:0];
        [indexPaths addObject:ip];
    }
    [self.collectionView insertItemsAtIndexPaths:indexPaths];
}

- (void)didFailToLoadDataWithError:(NSError *)error {
    self.isLoading = NO;
    self.didFail = YES;
    [self.collectionView deleteItemsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:1]]];
    NSLog(@"%@", error);
}


- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return section == 1 ? !self.didFail : self.items.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        UICollectionViewCell *loadingCell = [collectionView dequeueReusableCellWithReuseIdentifier:loadingCellIdentifier forIndexPath:indexPath];
        return loadingCell;
    }

    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    UITextView *text = [UITextView new];
    text.text = [NSString stringWithFormat:@"%@", self.items[indexPath.row]];
    cell.backgroundView = text;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1 && !self.isLoading) {
        [self loadDataUsingLastID:self.items.lastObject];
    }
}

@end
