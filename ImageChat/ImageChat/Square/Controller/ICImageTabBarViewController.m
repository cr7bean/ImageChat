//
//  ICImageTabBarViewController.m
//  ImageChat
//
//  Created by FigureWang on 17/1/2.
//  Copyright © 2017年 Long. All rights reserved.
//

#import "ICImageTabBarViewController.h"
#import "ICImageListViewController.h"

@interface ICImageTabBarViewController ()

@end

@implementation ICImageTabBarViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        [self encapsulateTabBarControllers];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)encapsulateTabBarControllers {
    ICImageListViewController *imageListController = [ICImageListViewController new];
    imageListController.tabBarItem = [[UITabBarItem alloc] initWithTitle: nil
                                                                   image: [UIImage imageNamed:@"tab-icon1"]tag:0];
    
    UINavigationController *squareNavigationController = [[UINavigationController alloc] initWithRootViewController:imageListController];
    self.tabBar.itemPositioning = UITabBarItemPositioningFill;
    self.viewControllers = @[squareNavigationController];
    
}

@end
