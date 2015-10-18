//
//  MyPageViewController.m
//  Lesson2
//
//  Created by Эдуард Рязапов on 08.10.15.
//  Copyright © 2015 Azat Almeev. All rights reserved.
//

#import "MyPageViewController.h"

@implementation MyPageViewController

static int pageNumber = 1;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = self;
    pageNumber = 1;
    [self setViewControllers:@[self.presentViewController] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
}

- (UIViewController *)presentViewController {
    return [self.storyboard instantiateViewControllerWithIdentifier:@"FirstView"];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    if (pageNumber == 1) {
        pageNumber = 2;
        return [self.storyboard instantiateViewControllerWithIdentifier:@"SecondView"];
    }
    if (pageNumber == 2) {
        pageNumber = 3;
        return [self.storyboard instantiateViewControllerWithIdentifier:@"ThirdView"];
    }
    return nil;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    if (pageNumber == 2) {
        pageNumber = 1;
        return [self.storyboard instantiateViewControllerWithIdentifier:@"FirstView"];
    }
    if (pageNumber == 3) {
        pageNumber = 2;
        return [self.storyboard instantiateViewControllerWithIdentifier:@"SecondView"];
    }
    return nil;
}

@end
