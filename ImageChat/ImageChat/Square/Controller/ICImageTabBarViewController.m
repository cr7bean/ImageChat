//
//  ICImageTabBarViewController.m
//  ImageChat
//
//  Created by FigureWang on 17/1/2.
//  Copyright © 2017年 Long. All rights reserved.
//

#import "ICImageTabBarViewController.h"
#import "ICImageListViewController.h"
#import "ICSearchImageViewController.h"
#import "ICSendImageViewController.h"
#import "ICMeViewController.h"

@interface ICImageTabBarViewController ()<UITabBarDelegate, UITabBarControllerDelegate>

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
    ICSearchImageViewController *searchImageController = [ICSearchImageViewController new];
    ICSendImageViewController *sendImageController = [ICSendImageViewController new];
    ICMeViewController *meViewController = [ICMeViewController new];
    NSArray *controllers = @[imageListController, searchImageController, sendImageController, meViewController];
    NSArray *imageNames = @[@"tab-icon1", @"tab-icon2", @"tab-icon3", @"tab-icon4"];
    NSMutableArray *navigationControllers = [NSMutableArray array];
    for (int i=0; i<controllers.count; i++) {
        [controllers[i] setTabBarItem:[[UITabBarItem alloc] initWithTitle:nil image:[UIImage imageNamed:imageNames[i]] tag:i]];
        UINavigationController *controller = [[UINavigationController alloc] initWithRootViewController:controllers[i]];
        [navigationControllers addObject:controller];
    }

    searchImageController.hidesBottomBarWhenPushed = YES;
    self.tabBar.itemPositioning = UITabBarItemPositioningFill;
    self.viewControllers = [navigationControllers copy];
    
}




- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    NSUInteger selectedIndex = [tabBar.items indexOfObject:item];
}


@end
